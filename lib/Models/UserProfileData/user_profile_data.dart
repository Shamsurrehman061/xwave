

import 'package:hive/hive.dart';

part 'user_profile_data.g.dart';


@HiveType(typeId: 2, adapterName: 'userProfileDataHive')

class UserProfileDataHive{

  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String avatar;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String username;
  @HiveField(4)
  final String info;


  UserProfileDataHive({required this.username, required this.phoneNumber, required this.avatar, required this.userId, required this.info});
}