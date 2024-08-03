import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';

abstract class SignupStatus extends Equatable {}

class SignUpInitail extends SignupStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpRouted extends SignupStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpLoading extends SignupStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUped extends SignupStatus {
  final RegisterEntity registerEntity;
  SignUped(this.registerEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [registerEntity];
}

class SignUpComplited extends SignupStatus {
  // final RegisterEntity registerEntity;
  // SignUpComplited(this.registerEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotSignUp extends SignupStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpError extends SignupStatus {
  final String? messageError;
  SignUpError(this.messageError);
  @override
  // TODO: implement props
  List<Object?> get props => [messageError];
}
