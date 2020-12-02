import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Karma_flutter/model/user.dart';
import 'package:logger/logger.dart';
import '../auth.dart';

class UserService {
  final FirebaseFirestore _user = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  Logger _logger = Logger();
  Future create(User user) async {
    try {
      await _user.collection("users").add(user.toMap());
      _logger.i("Created User :)");
    } catch (e) {
      _logger.e("Create User", e);
    }
  }

  Future<User> getWithEmail(String email) async {
    try {
      QuerySnapshot qShot = await _user
          .collection("users")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();
      List<User> data = qShot.docs
          .map((doc) => User(
              email: doc.get('email'),
              name: doc.get('name'),
              karma: doc.get('karma'),
              createdAt: doc.get('createdAt')))
          .toList();
      _logger.i("Get User: ${data[0]}");
      return data[0];
    } catch (e) {
      _logger.e("Get User", e);
    }
  }

  Future<User> getMe() async {
    try {
      QuerySnapshot qShot = await _user
          .collection("users")
          .where("email", isEqualTo: _auth.getUser().email)
          .limit(1)
          .get();
      List<User> data = qShot.docs
          .map((doc) => User(
              email: doc.get('email'),
              name: doc.get('name'),
              karma: doc.get('karma'),
              createdAt: doc.get('createdAt')))
          .toList();
      _logger.i("Get User: ${data[0]}");
      return data[0];
    } catch (e) {
      _logger.e("Get User", e);
    }
  }
}
