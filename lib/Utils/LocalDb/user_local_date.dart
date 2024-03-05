


import 'package:hive_flutter/adapters.dart';

class UserData{

  UserData(){init();}

  Box? box;

  init(){
    box = Hive.box("userToken");
  }


  getUserToken()async
  {
    return await box!.get("token");
  }

  getUserUid()async
  {
    return await box!.get("uid");
  }

  getUserContact()async
  {
    return await box!.get("contact");
  }

  saveUserToken(var token)
  {
    box!.put("token", token);
  }

  saveUserUid(var uid)
  {
    box!.put("uid", uid);
  }

  saveUserContact(var contact)
  {
    box!.put("contact", contact);
  }



}