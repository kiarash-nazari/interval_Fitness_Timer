import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterEntity extends Equatable{

  final User? user;
const RegisterEntity(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}