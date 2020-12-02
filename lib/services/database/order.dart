import 'package:Karma_flutter/model/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import '../auth.dart';

class OrderService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  Logger _logger = Logger();

  Future create(Order order) async {
    try {
      await _fs.collection("orders").add(order.toMap());
      _logger.i("Created Order :)");
    } catch (e) {
      _logger.e("Create Order", e);
    }
  }

  Future<Order> getById(String id) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("uid", isEqualTo: id)
          .limit(1)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Order ${data[0].uid}");
      return data[0];
    } catch (e) {
      _logger.e("Create Order", e);
    }
  }

  Future<Order> getActualAsMessenger(String email) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("messengerId", isEqualTo: email)
          .limit(1)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Order ${data[0].uid}");
      return data[0];
    } catch (e) {
      _logger.e("Create Order", e);
    }
  }

  Future<Order> getActualAsOwner(String email) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("ownerId", isEqualTo: email)
          .limit(1)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Order ${data[0].uid}");
      return data[0];
    } catch (e) {
      _logger.e("Create Order", e);
    }
  }

  Future<List<Order>> getLastThree(String ownerId) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("ownerId", isEqualTo: ownerId)
          .orderBy("createdAt", descending: true)
          .limit(3)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Three Orders");
      return data;
    } catch (e) {
      _logger.e("Get Three Order", e);
    }
  }

  Future<List<Order>> getUnassigned() async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("state", isEqualTo: 0)
          .orderBy("createdAt", descending: true)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Unassigned Orders");
      return data;
    } catch (e) {
      _logger.e("Get Unassigned Orders", e);
    }
  }

  Future completeOrder(String id) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("uid", isEqualTo: id)
          .limit(1)
          .get();
      List<Order> data = _qshotToOrderList(qShot);
      _logger.i("Get Order ${data[0].uid}");
      qShot.docs.map((doc) async =>
          await doc.reference.update({'state': data[0].state + 1}));
    } catch (e) {
      _logger.e("Complete", e);
    }
  }

  Future setMessenger(String id, String messengerId) async {
    try {
      QuerySnapshot qShot = await _fs
          .collection("orders")
          .where("uid", isEqualTo: id)
          .limit(1)
          .get();
      qShot.docs.map((doc) async =>
          await doc.reference.update({'messengerId': messengerId, 'state': 1}));
    } catch (e) {
      _logger.e("Set Msg", e);
    }
  }

  List<Order> _qshotToOrderList(QuerySnapshot qShot) {
    return qShot.docs
        .map((doc) => Order(
            extraData: doc.get('extraData'),
            location: doc.get('location'),
            messengerId: doc.get("messengerId"),
            ownerId: doc.get("ownerId"),
            state: doc.get("state"),
            uid: doc.get("uid")))
        .toList();
  }
}
