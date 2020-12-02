class ChatModel {
  final String message;
  final String sentBy;
  ChatModel({this.message, this.sentBy});

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sentBy': sentBy,
    };
  }
}
