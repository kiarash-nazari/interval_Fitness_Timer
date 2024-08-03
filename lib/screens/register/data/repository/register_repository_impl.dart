import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/data/data_source/remote/register_call.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  RegisterCall registerCall;
  RegisterEntity? registerEntity;
  RegisterRepositoryImpl(this.registerCall);

  //Register By google
  @override
  Future<DataState<RegisterEntity>> doRegister(User? user) async {
    try {
      User? theUser = await registerCall.registerByGoogle(user);
      registerEntity = RegisterEntity(theUser);
      return DataSucsess(registerEntity!);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

//Sign Out
  @override
  void signOut() {
    registerCall.signOut();
  }

//check if regestred
  @override
  Future<RegisterEntity?> checkRegister(User? user) async {
    User? theUser = user;
    registerEntity = RegisterEntity(theUser);

    return registerEntity;
  }

  //create user by email
  @override
  Future<DataState<UserCredential?>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential? userCredential =
          await registerCall.creatUserByEmailUsecase(email, password);
      return DataSucsess(userCredential);
    } on FirebaseException catch (e) {
      print("ssssssssssssssssssss${e.code}");
      return DataFailed(e.code);
    }
  }

  @override
  Future<DataState<User?>> logInByEmail(
      {required String email, required String password}) async {
    try {
      User? theUser =
          await registerCall.registerByEmail(email: email, password: password);
      return DataSucsess(theUser);
    } on FirebaseException catch (e) {
      return DataFailed(e.code);
    }
  }

  @override
  Future<DataState<void>> sendResetEmail({required String email}) async {
    try {
      var sendPasswordResetEmail = await registerCall.sendResetPassword(email);

      return DataSucsess(sendPasswordResetEmail);
    } on FirebaseException catch (e) {
      return DataFailed(e.code);
    }
  }
}
