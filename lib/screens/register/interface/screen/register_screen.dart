import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/status.dart';
import 'package:sign_in_button/sign_in_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<RegisterCubit, RegisteCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var registerCubit = BlocProvider.of<RegisterCubit>(context);

          if (state.registerStatus is RegisterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.registerStatus is Registered) {
            final Registered registered = state.registerStatus as Registered;
            final RegisterEntity registerEntity = registered.registerEntity;
            return Center(
              child: Text(registerEntity.user?.email ?? ""),
            );
          }
          if (state.registerStatus is NotRegister) {
            return Center(
              child: SignInButton(Buttons.google, onPressed: () {
                registerCubit.logInByGoogle();
              }),
            );
          }
          if (state.registerStatus is RegisterComplited) {
            final RegisterComplited registerComplited =
                state.registerStatus as RegisterComplited;
            final RegisterEntity registerEntity =
                registerComplited.registerEntity;
            return Center(child: Text((registerEntity.user?.email ?? "")));
          }
          return const SizedBox();
        },
      ),
    ));
  }
}
