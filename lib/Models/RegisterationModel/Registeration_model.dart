


class RegisterationModel {
  RegisterationModel({
      this.status, 
      this.message, 
      this.userId, 
      this.newUser, 
      this.phoneNumber,});

  RegisterationModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userId = json['user_id'];
    newUser = json['newUser'];
    phoneNumber = json['phoneNumber'];
  }
  String? status;
  String? message;
  String? userId;
  bool? newUser;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['user_id'] = userId;
    map['newUser'] = newUser;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}