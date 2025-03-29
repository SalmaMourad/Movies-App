import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/UI%20Screens/Login/Login.dart';
import 'package:movies_app/autih/firebace_Authcation.dart';
import 'package:movies_app/core/dialog_utils.dart';
import 'package:movies_app/core/validation.dart';
import 'package:movies_app/db/model/app_user.dart';
import 'package:movies_app/provider/auth_provider.dart'; // ✅ تأكد من أن هذا هو `AuthProvider` الصحيح
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color(0xffFFBB3B), size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Register',
          style: TextStyle(
              color: Color(0xffFFBB3B),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('Assets/Images/gamer1.png'),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                  controller: nameController,
                  hint: "Name",
                  icon: EvaIcons.person,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your Name";
                    }
                    return null;
                  }),
              const SizedBox(height: 15),
              _buildTextField(
                  controller: emailController,
                  hint: "Email",
                  icon: EvaIcons.email,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your Email";
                    }
                    if (!ValidationUtils.isValidEmail(text)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  }),
              const SizedBox(height: 15),
              _buildTextField(
                  controller: passwordController,
                  hint: "Password",
                  icon: EvaIcons.lock,
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter a password";
                    }
                    if (text.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  }),
              const SizedBox(height: 15),
              _buildTextField(
                  controller: rePasswordController,
                  hint: "Re-enter Password",
                  icon: EvaIcons.lock,
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter password confirmation";
                    }
                    if (text.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    if (passwordController.text != text) {
                      return "Passwords do not match";
                    }
                    return null;
                  }),
              const SizedBox(height: 15),
              _buildTextField(
                  controller: phoneController,
                  hint: "Enter your phone",
                  icon: EvaIcons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(text)) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  }),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: isLoading ? null : createAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFBB3B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 12),
                          Text("Loading..."),
                        ],
                      )
                    : const Text("Create Account",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have Account?",
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Login",
                        style: TextStyle(
                            color: Color(0xffFFBB3B),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  void createAccount() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    var response = await FirebaseAuthServices.createAccount(
        emailController.text, passwordController.text, nameController.text);
    if (response.userCredential != null) {
      firebase_auth.User? user = response.userCredential?.user;
      await user?.updateProfile(displayName: nameController.text);
      await user?.reload(); // تحديث بيانات المستخدم
    }

    setState(() {
      isLoading = false;
    });

    if (response.error != null) {
      showMessageDialog(
        response.error?.errorMessage ?? "Something went wrong",
        posActionTitle: "OK",
      );
      return; // ❌ لا تكمل باقي الكود إذا كان هناك خطأ
    }

    if (response.userCredential != null) {
      firebase_auth.User? user = response.userCredential?.user;

      // ✅ تحديث اسم المستخدم في Firebase Auth
      await user?.updateProfile(displayName: nameController.text);
      await user?.reload(); // تحديث بيانات المستخدم

      var authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.saveUser(response.user, phone: phoneController.text);

      showMessageDialog(
        "Successful registration",
        posActionTitle: "OK",
        posAction: () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
      );
    }
  }
}
