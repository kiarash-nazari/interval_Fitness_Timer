import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/domain/usecases/register_user_usecase.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/status.dart';

part 'registe_cubit_state.dart';

class RegisterCubit extends Cubit<RegisteCubitState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  RegisterUserUsecase registerUserUsecase;
  RegisterCubit(this.registerUserUsecase)
      : super(RegisteCubitState(registerStatus: RegisterInitail())) {
    _auth.authStateChanges().listen((onData) {
      user = onData;
      if (user == null) {
        emit(state.copyWith(newRegisterStatus: NotRegister()));
      } else if (user != null) {
        RegisterEntity registerEntity = RegisterEntity(user);
        emit(state.copyWith(newRegisterStatus: Registered(registerEntity)));
      }
    });
  }

  Future<void> logInByGoogle() async {
    DataState dataState = await registerUserUsecase(user);
    if (dataState is DataSucsess) {
      emit(
          state.copyWith(newRegisterStatus: RegisterComplited(dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newRegisterStatus: RegisterError(dataState.error)));
    }
  }
}
