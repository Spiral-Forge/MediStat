class Hospital {
  String uid;
  String email;
  String type;
  String name;
  String contact;
  String address;

  Hospital({
    this.uid,
    this.email,
    this.type,
    this.name,
    this.contact,
    this.address
  });

  Map toMap(Hospital hospital) {
    var data = Map<String, dynamic>();
    data['uid'] = hospital.uid;
    data['email'] = hospital.email;
    data['type']=hospital.type;
    data['name'] = hospital.name;
    data['contact'] = hospital.contact;
    data['address']=hospital.address;
    return data;
  }

  // Named constructor
  Hospital.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.type=mapData["type"];
    this.name= mapData['name'] ;
    this.contact=mapData['contact'] ;
    this.address=mapData['address'];
  }
}