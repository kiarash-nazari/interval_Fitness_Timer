// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/domain/usecases/register_user_usecase.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/signup_status.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/status.dart';

part 'registe_cubit_state.dart';

class RegisterCubit extends Cubit<RegisteCubitState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  RegisterUserUsecase registerUserUsecase;
  RegisterCubit(this.registerUserUsecase)
      : super(RegisteCubitState(
            registerStatus: RegisterInitail(), signupStatus: SignUpInitail())) {
    _auth.authStateChanges().listen((onData) async {
      emit(state.copyWith(newRegisterStatus: RegisterLoading()));
      // signOut();
      user = onData;
      print(user?.email ?? "nuullllllllllllll");
      if (user == null) {
        emit(state.copyWith(newRegisterStatus: NotRegister()));
      } else {
        RegisterEntity registerEntity = RegisterEntity(user);
        await Future.delayed(const Duration(seconds: 1));

        registred(registerEntity);
      }
    });
  }

  Future<void> registred(RegisterEntity registerEntity) async {
    print("User registered: ${registerEntity.user?.email}");

    // emit(state.copyWith(newRegisterStatus: RegisterLoading()));
    await Future.delayed(const Duration(seconds: 2));
    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(newRegisterStatus: Registered(registerEntity)));
  }

  Future<void> logInByGoogle() async {
    emit(state.copyWith(newRegisterStatus: RegisterLoading()));

    DataState dataState = await registerUserUsecase(user);
    if (dataState is DataSucsess) {
      emit(
          state.copyWith(newRegisterStatus: RegisterComplited(dataState.data)));
    } else if (dataState is DataFailed) {
      emit(state.copyWith(newRegisterStatus: RegisterError(dataState.error)));
    }
  }

  Future<void> signOut() async {
    registerUserUsecase.signOut();
    emit(state.copyWith(newRegisterStatus: NotRegister()));
  }

  void routToSignup() {
    emit(state.copyWith(newSignUpStatus: SignUpRouted()));
    emit(state.copyWith(newSignUpStatus: SignUpInitail()));
  }

  void initialRegister() {
    emit(state.copyWith(newRegisterStatus: NotRegister()));
  }
}


  // Future<void> checkRegister() async {
  //   RegisterEntity? dataState = await registerUserUsecase.checkRegister(user);
  //   if (dataState?.user == null) {
  //     emit(state.copyWith(newRegisterStatus: NotRegister()));
  //   }
  //   if (dataState?.user != null) {
  //     print("AHHHHHHHHHAy");
  //     emit(state.copyWith(newRegisterStatus: Registered(dataState!)));
  //   }
  // }