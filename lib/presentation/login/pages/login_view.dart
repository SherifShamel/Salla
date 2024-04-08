import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/core/config/application_theme_manager.dart';
import 'package:salla/core/config/page_routes_names.dart';
import 'package:salla/core/widgets/custom_text_field.dart';
import 'package:salla/main.dart';
import 'package:salla/presentation/login/viewModel/cubit.dart';
import 'package:salla/presentation/login/viewModel/states.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewModel, LoginStates>(
      bloc: loginViewModel,
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: ApplicationThemeManager.themeData.primaryColor,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: ApplicationThemeManager.mediaQuery.height * 0.1),
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
                      "Welcome Back To Route",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Please sign in with your mail",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      controller: emailController,
                      hint: "Enter Your Email",
                      keyboardType: TextInputType.emailAddress,
                      onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return "You Must Enter Your Email ID !";
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
                    const SizedBox(height: 5),
                    CustomTextField(
                      controller: passwordController,
                      hint: "Enter Your Password",
                      isPassword: true,
                      maxLines: 1,
                      onValidate: (value) {
                        if (value!.trim().isEmpty) {
                          return "You Must Enter A Password.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Forgot Password ?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginViewModel
                                .login(
                              emailController.text,
                              passwordController.text,
                            )
                                .then((value) {
                              if (value) {
                                navigatorKey.currentState
                                    ?.pushNamedAndRemoveUntil(
                                        PageRouteName.layout, (route) => false);
                              }
                            });
                          }
                        },
                        child: const Text(
                          "Login",
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
                    GestureDetector(
                      onTap: () {
                        navigatorKey.currentState
                            ?.pushNamed(PageRouteName.registration);
                      },
                      child: const Text(
                        "Don't have an Account? create One !",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        /*switch (state) {
          case LoadingLoginState():
            {
              Center(
                child: CircularProgressIndicator(
                  color: ApplicationThemeManager.themeData.primaryColor,
                ),
              );
            }
          case ErrorLoginState():{
            return "Something Went Wrong";
          }
          case SuccessLoginState():{
            return Scaffold(
              backgroundColor: ApplicationThemeManager.themeData.primaryColor,
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      top: ApplicationThemeManager.mediaQuery.height * 0.1),
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
                          "Welcome Back To Route",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Please sign in with your mail",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Email Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: emailController,
                          hint: "Enter Your Email",
                          keyboardType: TextInputType.emailAddress,
                          onValidate: (value) {
                            if (value == null || value.isEmpty) {
                              return "You Must Enter Your Email ID !";
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
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: passwordController,
                          hint: "Enter Your Password",
                          isPassword: true,
                          maxLines: 1,
                          onValidate: (value) {
                            if (value!.trim().isEmpty) {
                              return "You Must Enter A Password.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Forgot Password ?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // TODO: calling loginAPI
                              }
                            },
                            child: const Text(
                              "Login",
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
                        GestureDetector(
                          onTap: () {
                            navigatorKey.currentState
                                ?.pushNamed(PageRouteName.registration);
                          },
                          child: const Text(
                            "Don't have an Account? create One !",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }*/
      },
    );
  }
}
