part of 'registe_cubit.dart';

class RegisteCubitState {
  RegisterStatus registerStatus;
  SignupStatus signupStatus;
  RegisteCubitState({required this.registerStatus, required this.signupStatus});

  RegisteCubitState copyWith(
      {RegisterStatus? newRegisterStatus, SignupStatus? newSignUpStatus}) {
    return RegisteCubitState(
        registerStatus: newRegisterStatus ?? registerStatus,
        signupStatus: newSignUpStatus ?? signupStatus);
  }
}
