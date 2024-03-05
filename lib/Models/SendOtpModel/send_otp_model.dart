


class SendOtpModel {
  SendOtpModel({
      this.status, 
      this.message, 
      this.otp, 
      this.userId,
  });

  SendOtpModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
    userId = json['userId'];
  }
  String? status;
  String? message;
  String? otp;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['otp'] = otp;
    map['userId'] = userId;
    return map;
  }

}