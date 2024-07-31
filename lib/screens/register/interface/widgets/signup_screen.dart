import 'package:flutter/material.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';

import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_text_field.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key, required this.registerCubit});
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegisterTextField(
              textEditingController: emailTextEditingController,
              scure: false,
              hint: "Email"),
          const SizedBox(
            height: 12,
          ),
          RegisterTextField(
              textEditingController: passwordTextEditingController,
              scure: false,
              hint: "Password"),
          const SizedBox(
            height: 12,
          ),
          RegisterTextField(
              textEditingController: confirmPasswordTextEditingController,
              scure: false,
              hint: "Confirm Password"),
          const SizedBox(
            height: 12,
          ),
          RegisterButton(buttontext: "SignUp", onTap: () {}),
          const SizedBox(
            height: 24,
          ),
          SignInButton(
            text: "Sign up with Google",
            Buttons.googleDark,
            onPressed: () {
              registerCubit.logInByGoogle();
            },
          ),
        ],
      ),
    );
  }
}
