import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // استيراد Firebase Auth
import 'package:icons_plus/icons_plus.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = "ForgetPassword";
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());

      // ✅ إظهار رسالة تأكيد بعد نجاح الإرسال
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent successfully!")),
      );

      Navigator.pop(context); // الرجوع لصفحة تسجيل الدخول
    } on FirebaseAuthException catch (e) {
      // ❌ في حالة وجود خطأ، عرض رسالة للمستخدم
      String errorMessage = "Something went wrong. Please try again.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Forget Password",
            style: TextStyle(color: Color(0xffFFBB3B)),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xffFFBB3B)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("Assets/Images/ForgotPassword.png"),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(EvaIcons.email),
                      hintText: "Email",
                    ),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : resetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFBB3B),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.black)
                        : const Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.black, fontSize: 16),
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
}
