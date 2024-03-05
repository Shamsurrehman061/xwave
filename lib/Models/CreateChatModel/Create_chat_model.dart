import 'Users.dart';

class CreateChatModel {
  CreateChatModel({
      this.id, 
      this.users, 
      this.groupAvatar, 
      this.latestMessages, 
      this.isGroupChat, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  CreateChatModel.fromJson(dynamic json) {
    id = json['_id'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    groupAvatar = json['GroupAvatar'];
    if (json['latestMessages'] != null) {
      latestMessages = [];
      json['latestMessages'].forEach((v) {
        latestMessages?.add(v);
      });
    }
    isGroupChat = json['isGroupChat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  List<Users>? users;
  String? groupAvatar;
  List<dynamic>? latestMessages;
  bool? isGroupChat;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    map['GroupAvatar'] = groupAvatar;
    if (latestMessages != null) {
      map['latestMessages'] = latestMessages?.map((v) => v.toJson()).toList();
    }
    map['isGroupChat'] = isGroupChat;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}