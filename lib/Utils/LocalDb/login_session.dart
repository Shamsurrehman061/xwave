import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class LoginSession {

  LoginSession(){
    init();
  }

  Box<bool>? box;


  init()
  {
    box = Hive.box("loginSession");
  }


  getLoginSession()async
  {
    return box!.get("isLogin");
  }

  saveLoginSession(bool isLogin)
  {
    box!.put("isLogin", isLogin);
  }


}