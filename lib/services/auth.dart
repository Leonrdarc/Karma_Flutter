import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  Future<User> signIn(String email, String pass) async {
    try {
      logger.d("Email: $email \nPassword: $pass");
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      logger.i("User successfully logged");
      return user;
    } catch (e) {
      logger.e("Login", e);
    }
  }

  Future<User> signUp(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = result.user;
      logger.i("User successfully created");
      return user;
    } catch (e) {
      logger.e("Register", e);
    }
  }

  User getUser() {
    try {
      logger.i("Getting User");
      User user = _auth.currentUser;
      return user;
    } catch (e) {
      logger.e("Login", e);
    }
  }

  void logout() async {
    try {
      _auth.signOut();
      logger.i("Logout");
    } catch (e) {
      logger.e("Logout", e);
    }
  }
}
