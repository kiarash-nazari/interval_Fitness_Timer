import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/data/data_source/remote/register_call.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  RegisterCall registerCall;
  RegisterRepositoryImpl(this.registerCall);
  @override
  Future<DataState<RegisterEntity>> doRegister(User? user) async {
    try {
      User? theUser = await registerCall.registerByGoogle(user);
      RegisterEntity registerEntity = RegisterEntity(theUser);
      return DataSucsess(registerEntity);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
