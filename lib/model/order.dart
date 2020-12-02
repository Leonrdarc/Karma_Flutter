class Order {
  final String uid;
  final int state;
  final String ownerId;
  final String messengerId;
  final String type;
  final String description;
  final String location;
  final String extraData;
  Order(
      {this.uid,
      this.state,
      this.ownerId,
      this.messengerId,
      this.extraData,
      this.location,
      this.description,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'state': state,
      'ownerId': ownerId,
      'messengerId': messengerId,
      'extraData': extraData,
      'location': location,
      'description': description,
      'type': type,
    };
  }
}
