

import 'package:hive/hive.dart';

part 'hive_phone_number_model.g.dart';



@HiveType(typeId: 3, adapterName: 'hivePhoneNumberModel')
class PhoneNumberModelForHive {


  @HiveField(0)
  final String avatar;
  @HiveField(1)
  final String contact;
  @HiveField(2)
  final String userId;


  PhoneNumberModelForHive({required this.avatar, required this.userId, required this.contact});

}