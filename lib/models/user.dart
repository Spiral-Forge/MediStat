class User {
  String uid;
  String email;
  String type;

  User({
    this.uid,
    this.email,
    this.type
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['type']=user.type;
    return data;
  }

  // Named constructor
  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.type=mapData["type"];
  }
}