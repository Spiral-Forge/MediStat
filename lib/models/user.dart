class User {
  String uid;
  String email;
  String type;
  String name;

  User({
    this.uid,
    this.email,
    this.type,
    this.name
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['type']=user.type;
    data['name']=user.name;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.type=mapData["type"];
    this.name=mapData["name"];
  }
}