import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/use_case.dart';
import 'package:interval_timer/screens/register/domain/repository/register_repository.dart';

class CreatUserByEmailUsecase
    extends UseCaseCreate<DataState<UserCredential?>, String> {
  RegisterRepository registerRepository;
  CreatUserByEmailUsecase(this.registerRepository);

  @override
  Future<DataState<UserCredential?>> call(String email, String password) {
    // TODO: implement call
    return registerRepository.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
