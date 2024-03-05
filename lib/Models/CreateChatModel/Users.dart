class Users {
  Users({
      this.id, this.contact});

  Users.fromJson(dynamic json) {
    id = json['_id'];
  }
  String? id;
  String? contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['phoneNumber'] = contact;
    return map;
  }

}