class VerifyOtpModel {
  VerifyOtpModel({
      this.status, 
      this.message, 
      this.token, 
      this.userId, 
      this.phoneNumber, 
      this.newUser,});

  VerifyOtpModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    userId = json['user_id'];
    phoneNumber = json['phoneNumber'];
    newUser = json['newUser'];
  }
  String? status;
  String? message;
  String? token;
  String? userId;
  String? phoneNumber;
  bool? newUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['token'] = token;
    map['user_id'] = userId;
    map['phoneNumber'] = phoneNumber;
    map['newUser'] = newUser;
    return map;
  }

}