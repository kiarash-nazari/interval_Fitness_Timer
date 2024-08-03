import 'package:firebase_auth/firebase_auth.dart';

class RegisterCall {
  final GoogleAuthProvider _googleAoutProvider = GoogleAuthProvider();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendResetPassword(String email)async{
    var reset =await _auth.sendPasswordResetEmail(email: email);
 return reset;
  }


  Future<User?> registerByEmail(
      {required String email, required String password}) async {
    var userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    return user;
  }

  Future<User?> registerByGoogle(User? user) async {
    await _auth.signInWithProvider(_googleAoutProvider);
    _auth.authStateChanges().listen((event) {
      user = event;
      if (user == null) {}
    });
    return user;
  }

  Future<UserCredential?> creatUserByEmailUsecase(
      String email, String password) async {
    UserCredential? userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

  Future<User?> checkRegister(User? user) async {
    _auth.authStateChanges().listen((event) {
      user = event;
    });
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
