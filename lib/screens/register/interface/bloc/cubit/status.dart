import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';

abstract class RegisterStatus extends Equatable {}

class RegisterInitail extends RegisterStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Registered extends RegisterStatus {
  final RegisterEntity registerEntity;
  Registered(this.registerEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [registerEntity];
}

class RegisterComplited extends RegisterStatus {
  final RegisterEntity registerEntity;
  RegisterComplited(this.registerEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [registerEntity];
}

class NotRegister extends RegisterStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterError extends RegisterStatus {
  final String? messageError;
  RegisterError(this.messageError);
  @override
  // TODO: implement props
  List<Object?> get props => [messageError];
}
