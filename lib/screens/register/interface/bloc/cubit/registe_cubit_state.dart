part of 'registe_cubit.dart';

class RegisteCubitState {
  RegisterStatus registerStatus;
  RegisteCubitState({required this.registerStatus});

  RegisteCubitState copyWith({RegisterStatus? newRegisterStatus}) {
    return RegisteCubitState(
        registerStatus: newRegisterStatus ?? registerStatus);
  }
}
