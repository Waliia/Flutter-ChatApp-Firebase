import 'package:flutter/material.dart';

typedef void LoginBtnClick({
  required var context,
  required var passwordController,
  required var emailController,
  required var emailValidationKey,
  required var passwordValidationKey,
});
typedef void RegisterBtnClick(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormFieldState> passwordValidationKey});

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> emailValidationKey;
  final GlobalKey<FormFieldState> passwordValidationKey;
  final LoginBtnClick loginBtnClick;

  const LoginButton(
      {required this.loginBtnClick,
      required this.emailController,
      required this.passwordController,
      required this.emailValidationKey,
      required this.passwordValidationKey,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      onPressed: () {
        loginBtnClick(
            context: context,
            emailController: emailController,
            passwordController: passwordController,
            passwordValidationKey: passwordValidationKey,
            emailValidationKey: emailValidationKey);
      },
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> nameValidationKey;
  final GlobalKey<FormFieldState> emailValidationKey;
  final GlobalKey<FormFieldState> passwordValidationKey;
  final RegisterBtnClick registerBtnClick;
  const RegisterButton({
    Key? key,
    required this.registerBtnClick,
    required this.nameController,
    required this.passwordController,
    required this.emailController,
    required this.nameValidationKey,
    required this.emailValidationKey,
    required this.passwordValidationKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      onPressed: () {
        registerBtnClick(
            emailValidationKey: emailValidationKey,
            emailController: emailController,
            passwordValidationKey: passwordValidationKey,
            passwordController: passwordController,
            nameController: nameController,
            nameValidationKey: nameValidationKey,
            context: context);
      },
      child: const Text(
        'Register',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
