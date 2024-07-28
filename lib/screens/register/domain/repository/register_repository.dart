import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';

abstract class RegisterRepository{
  Future<DataState<RegisterEntity>> doRegister(User? user);
}