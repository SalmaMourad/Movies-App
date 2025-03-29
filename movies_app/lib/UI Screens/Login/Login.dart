import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/UI%20Screens/Register/register.dart';
import 'package:movies_app/UI%20Screens/forget%20password/forget_password.dart';
import 'package:movies_app/UI%20Screens/profile/profile_screen.dart';
import 'package:movies_app/autih/firebace_Authcation.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/autih/google_auth.dart';
import 'package:movies_app/core/dialog_utils.dart';
import 'package:movies_app/db/model/app_user.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/autih/firebace_Authcation.dart';
import 'package:movies_app/autih/firebace_Authcation.dart'; // FirebaseAuthServices
import 'package:movies_app/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isLoading = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'Assets/Images/move.png',
                    height: MediaQuery.sizeOf(context).height * .22,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(EvaIcons.email, color: Colors.white),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    // color: Colors.white,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter your Email";
                      }
                      if (!text.contains('@')) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(EvaIcons.lock, color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter password";
                      }
                      if (text.length < 6) {
                        return "Password should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetPassword.routeName);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color(0xffFFBB3B)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            login();
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xffFFBB3B), // تغيير لون الخلفية
                      foregroundColor: Colors.white, // تغيير لون النص
                    ),
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(width: 12),
                              Text("Loading...")
                            ],
                          )
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Color(0xffFFBB3B), // تغيير اللون
                            decoration:
                                TextDecoration.underline, // إضافة خط تحت النص
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                            Text("OR", style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () async {
                      final user = await _authService.signInWithGoogle();
                      if (user != null) {
                        print("Signed in: ${user.displayName}");
                        Navigator.pushReplacementNamed(
                            context, UserProfileScreen.routeName);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Brand(Brands.google),
                        const SizedBox(width: 8),
                        Text("Login with Google")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      print("Not valid");
      return;
    }

    setState(() {
      isLoading = true;
    });

    var response = await FirebaseAuthServices.login(
        emailController.text, passwordController.text);

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (response.userCredential != null) {
      // ✅ جلب المستخدم بعد تسجيل الدخول
      firebase_auth.User? user = response.userCredential?.user;

      if (user != null) {
        var authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider.setUser(user); // حفظ بيانات المستخدم في Provider

        showMessageDialog("Logged in successfully", posActionTitle: "OK",
            posAction: () {
          Navigator.pushReplacementNamed(context, UserProfileScreen.routeName);
        });
      }
    } else {
      showMessageDialog(response.error?.errorMessage ?? "Login failed",
          posActionTitle: "OK");
    }
  }
}

extension on firebase_auth.AuthProvider {
  void saveUser(AppUser? user) {}
}

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final String hintText;
//   final IconData icon;
//   final bool isPassword;
//   final String? Function(String?)? validator;
//   final Color? color; // ✅ أضف معامل اللون

//   const CustomTextFormField({
//     required this.controller,
//     required this.labelText,
//     required this.hintText,
//     required this.icon,
//     this.isPassword = false,
//     this.validator,
//     this.color, // ✅ تأكد من إضافته هنا أيضًا
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       validator: validator,
//       style: TextStyle(color: color ?? Colors.white),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[900],
//         labelText: labelText,
//         hintText: hintText,
//         labelStyle: TextStyle(color: Colors.white),
//         prefixIcon: Icon(icon, color: Colors.white),
//         suffixIcon:
//             isPassword ? Icon(Icons.visibility_off, color: Colors.white) : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Color(0xffFFBB3B)),
//         ),
//       ),
//     );
//   }
// }
