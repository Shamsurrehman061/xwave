



import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../Models/UserProfileData/user_profile_data.dart';

class UserProfileData{

  UserProfileData(){init();}

  Box<UserProfileDataHive>? box;

  init()
  {
    box = Hive.box("UserProfileData");
  }

  addData(UserProfileDataHive userProfileDataHive)async
  {
    print(userProfileDataHive.username);


    if(!box.isNull)
      {
        await box!.clear();
        await box!.add(UserProfileDataHive(
            username: userProfileDataHive.username,
            phoneNumber: userProfileDataHive.phoneNumber,
            avatar: userProfileDataHive.avatar,
            userId: userProfileDataHive.userId,
            info: userProfileDataHive.info,
        )
        );
      }
    else
      {
        box!.add(UserProfileDataHive(
          username: userProfileDataHive.username,
          phoneNumber: userProfileDataHive.phoneNumber,
          avatar: userProfileDataHive.avatar,
          userId: userProfileDataHive.userId,
          info: userProfileDataHive.info,
        )
        );
      }
  }

   getData()
  {
    return box!.values.toList();
  }

}