import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';

abstract class RegisterRepository {
  Future<DataState<RegisterEntity>> doRegister(User? user);
  void signOut();
  Future<RegisterEntity?> checkRegister(User? user);
  Future<DataState<UserCredential?>> createUserWithEmailAndPassword(
      {required String email, required String password});

  Future<DataState<User?>> logInByEmail(
      {required String email, required String password});
}
