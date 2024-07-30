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
          listenWhen: (previous, current) {
            print("sssssssssssssssssssss");
            return previous.registerStatus != current.registerStatus;
            // if (previous.registerStatus == current.registerStatus) {
            //   print(
            //       "MOOOOOOOOOOSSSSSSSSSSSSSSSSSAAAAAAAAAAAAVVVVVVVVVIIIIIIIIIII");
            //   return true;
            // }
            // if (previous.registerStatus != current.registerStatus) {
            //   print(
            //       "NNNNNNNOtMOOOOOOOOOOSSSSSSSSSSSSSSSSSAAAAAAAAAAAAVVVVVVVVVIIIIIIIIIII");
            //   return true;
            // }
            // return true;
          },
          listener: (context, state) {
            print("some thing");
            if (state.registerStatus is Registered) {
              Navigator.pushNamed(context, '/mainWindow');
            } else if (state.registerStatus is RegisterError) {
              // Handle error state if needed
              final errorState = state.registerStatus as RegisterError;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(errorState.messageError ?? 'Unknown error')));
            }
          },
          builder: (context, state) {
            var registerCubit = BlocProvider.of<RegisterCubit>(context);

            if (state.registerStatus is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //  else if (state.registerStatus is Registered) {
            //   return const Center(
            //     child: Text("Registered"),
            //   );
            // }
            else if (state.registerStatus is NotRegister) {
              return Center(
                child: SignInButton(
                  Buttons.google,
                  onPressed: () {
                    registerCubit.logInByGoogle();
                  },
                ),
              );
            } else if (state.registerStatus is RegisterComplited) {
              final registerComplited =
                  state.registerStatus as RegisterComplited;
              final registerEntity = registerComplited.registerEntity;
              return Center(child: Text(registerEntity.user?.email ?? ""));
            } else if (state.registerStatus is RegisterError) {
              return const Center(
                child: Text("Registration failed"),
              );
            }
            return const Center(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }
}
