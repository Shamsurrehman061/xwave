class RegisterUserModel {
  RegisterUserModel({
      this.id, 
      this.phoneNumber, 
      this.avatar,});

  RegisterUserModel.fromJson(dynamic json) {
    id = json['_id'];
    phoneNumber = json['phoneNumber'];
    avatar = json['avatar'];
  }
  String? id;
  String? phoneNumber;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['phoneNumber'] = phoneNumber;
    map['avatar'] = avatar;
    return map;
  }

}