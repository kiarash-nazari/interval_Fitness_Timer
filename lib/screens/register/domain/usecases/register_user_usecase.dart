import 'package:firebase_auth/firebase_auth.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/use_case.dart';
import 'package:interval_timer/screens/register/domain/entites/register_entity.dart';
import 'package:interval_timer/screens/register/domain/repository/register_repository.dart';

class RegisterUserUsecase extends UseCase<DataState<RegisterEntity>, User?> {
  RegisterRepository registerRepository;
  RegisterUserUsecase(this.registerRepository);
  @override
  Future<DataState<RegisterEntity>> call(prompt) {
    return registerRepository.doRegister(prompt);
  }

  Future<RegisterEntity?> checkRegister(User? user) {
    return registerRepository.checkRegister(user);
  }

  void signOut() {
    registerRepository.signOut();
  }

  Future<DataState<User?>> logInByEmail(
      {required String email, required String password}) {
    return registerRepository.logInByEmail(email: email, password: password);
  }

  Future<DataState<void>> sendPasswordResetEmail({required String email}) {
    return registerRepository.sendResetEmail(email: email);
  }
}
