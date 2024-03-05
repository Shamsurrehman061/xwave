


import 'package:hive/hive.dart';

import '../../Models/PhoneNumberModelForHive/hive_phone_number_model.dart';

class PhoneContacts {
  PhoneContacts(){init();}

  Box<PhoneNumberModelForHive>? box;
  init()
  {
    box = Hive.box("PhoneContacts");
  }

  addContact(var avatar, var userId, var contact)
  {

    final checkValue = box!.values.any((element) => element.contact == contact);

    if(!checkValue)
      {
        print("added");
        box!.add(PhoneNumberModelForHive(avatar: avatar, userId: userId, contact: contact));
      }
    else
      {
        print("not added");
      }

  }

  getContact()
  {
    return box!.values.toList();
  }

}