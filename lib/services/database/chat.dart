import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class ChatService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  Logger _logger = Logger();
}
