import 'package:firebase_auth/firebase_auth.dart';

class RegisterCall {
  final GoogleAuthProvider _googleAoutProvider = GoogleAuthProvider();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerByGoogle(User? user) async {
    await _auth.signInWithProvider(_googleAoutProvider);
    _auth.authStateChanges().listen((event) {
      user = event;
      if (user == null) {}
    });
    return user;
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
