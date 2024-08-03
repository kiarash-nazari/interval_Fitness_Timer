import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/signup_status.dart';

import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_text_field.dart';
import 'package:interval_timer/widgets/my_flush_bar.dart';
import 'package:interval_timer/widgets/player_controller.dart';
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
    var registerCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisteCubitState>(
      listenWhen: (previous, current) {
        return previous.signupStatus != current.signupStatus;
      },
      listener: (context, state) {
        if (state.signupStatus is SignUpError) {
          final erroState = state.signupStatus as SignUpError;
          String? errorText = erroState.messageError;
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(errorText ?? "")));
          MyFlushBar().myFlushBar(errorText!).show(context);
        }
      },
      buildWhen: (previous, current) {
        return previous.signupStatus != current.signupStatus;
      },
      builder: (context, state) {
        if (state.signupStatus is SignUpLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                RegisterButton(
                    buttontext: "SignUp",
                    onTap: () {
                      registerCubit.creatUserByEmail(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
                          confPassword:
                              confirmPasswordTextEditingController.text);
                    }),
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
          ),
        );
      },
    );
  }
}
