import 'package:flutter/material.dart';
import 'package:salla/core/config/application_theme_manager.dart';
import 'package:salla/core/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationThemeManager.themeData.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: ApplicationThemeManager.mediaQuery.height * 0.05),
          reverse: true,
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/header.png"),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Full Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: userNameController,
                  hint: "Enter Your Full Name",
                  keyboardType: TextInputType.emailAddress,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return "You Must Enter Your Name !";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Mobile Number",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: mobileNumberController,
                  hint: "Enter Your Phone Number",
                  onValidate: (value) {
                    if (value!.trim().isEmpty) {
                      return "You Must Enter Your Phone Number.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Email Address",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  hint: "Enter Your Email Address",
                  onValidate: (value) {
                    if (value!.trim().isEmpty) {
                      return "You Must Enter Your Email Address.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
                  hint: "Enter Your Password",
                  isPassword: true,
                  maxLines: 1,
                  onValidate: (value) {
                    if (value!.trim().isEmpty) {
                      return "You Must Enter Your Password.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // TODO: calling loginAPI
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
