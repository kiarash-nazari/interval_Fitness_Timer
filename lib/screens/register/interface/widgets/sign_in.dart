import 'package:flutter/material.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_text_field.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SIgnInScreen extends StatelessWidget {
  SIgnInScreen(
      {super.key, required this.registerCubit, required this.pageController});

  final TextEditingController emailTextControler = TextEditingController();
  final TextEditingController passwordTextControler = TextEditingController();
  final RegisterCubit registerCubit;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterTextField(
                textEditingController: emailTextControler,
                scure: false,
                hint: "Email",
              ),
              const SizedBox(
                height: 12,
              ),
              RegisterTextField(
                textEditingController: passwordTextControler,
                scure: true,
                hint: "Password",
              ),
              const SizedBox(
                height: 12,
              ),
              RegisterButton(
                  buttontext: "LogIn",
                  onTap: () {
                    registerCubit.logInByEmail(
                        email: emailTextControler.text,
                        password: passwordTextControler.text);
                  }),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  registerCubit.routToSignup();
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12)
                    // foregroundColor: Colors.transparent,
                    ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Set the desired text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SignInButton(
                Buttons.google,
                onPressed: () {
                  registerCubit.logInByGoogle();
                },
              ),
              TextButton(
                  onPressed: () {
                    registerCubit.sendResetPasswordEmail(
                        email: emailTextControler.text);
                  },
                  child: const Text('Forgot Password'))
            ],
          ),
        ),
      ),
    );
  }
}
