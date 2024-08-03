// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/signup_status.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/status.dart';
import 'package:interval_timer/screens/register/interface/widgets/sign_in.dart';
import 'package:interval_timer/screens/register/interface/widgets/signup_screen.dart';
import 'package:interval_timer/widgets/my_flush_bar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisteCubitState>(
          listenWhen: (previous, current) {
            return previous.registerStatus != current.registerStatus;
          },
          listener: (context, state) {
            var registerCubit = BlocProvider.of<RegisterCubit>(context);

            if (state.registerStatus is RoutToSignUpRegister) {
              pageController.animateToPage(2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInCirc);
            }
            if (state.registerStatus is Registered ||
                state.registerStatus is RegisterComplited) {
              Navigator.pushNamed(context, '/mainWindow');
            } else if (state.registerStatus is RegisterError) {
              final erroState = state.registerStatus as RegisterError;
              String? errorText = erroState.messageError;
              // Handle error state if needed
              // final errorState = state.registerStatus as RegisterError;
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text(errorText ?? "")));
              MyFlushBar().myFlushBar(errorText!).show(context);
              registerCubit.initialRegister();
            }

            if (state.registerStatus is SendResetPasswordEmail) {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(colors: AppColors.grMidLevel),
                      ),
                      child: const Text(
                        "Check Your Email We Sent A Link To Restart Your Password",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            }
          },
          buildWhen: (previous, current) {
            if (current.registerStatus is RoutToSignUpRegister) {
              return false;
            }

            return previous.registerStatus != current.registerStatus;
          },
          builder: (context, state) {
            var registerCubit = BlocProvider.of<RegisterCubit>(context);

            if (state.registerStatus is RegisterInitail) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.registerStatus is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.registerStatus is NotRegister ||
                state.registerStatus is RegisterError) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: PageView(
                      controller: pageController,
                      children: [
                        SIgnInScreen(
                          registerCubit: registerCubit,
                          pageController: pageController,
                        ),
                        SignupScreen(
                          registerCubit: registerCubit,
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(controller: pageController, count: 2),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              );
            }
            // else if (state.registerStatus is RegisterComplited) {
            //   final registerComplited =
            //       state.registerStatus as RegisterComplited;
            //   final registerEntity = registerComplited.registerEntity;
            //   return Center(child: Text(registerEntity.user?.email ?? ""));
            // }
            // else if (state.registerStatus is RegisterError) {
            //   return const Center(
            //     child: Text("Registration failed"),
            //   );
            // }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
