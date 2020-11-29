class User {
  String uid;
  String email;
  String type;
  String contact;
  String name;

  User({
    this.uid,
    this.email,
    this.type,
    this.contact,
    this.name
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['type']=user.type;
    data['name']=user.name;
    data['contact']=user.contact;
    return data;
  }

  // Named constructor
  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.type=mapData["type"];
    this.name=mapData["name"];
    this.contact=mapData["contact"];
  }
}