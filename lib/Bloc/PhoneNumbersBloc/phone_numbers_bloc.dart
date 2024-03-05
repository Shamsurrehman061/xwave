


import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:x_wave/Bloc/PhoneNumbersBloc/phone_number_event.dart';
import 'package:x_wave/Bloc/PhoneNumbersBloc/phone_number_states.dart';
import 'package:x_wave/Repository/LoginRepository/Network/network.dart';
import 'package:x_wave/Res/AppUrls/app_urls.dart';
import 'package:x_wave/Utils/LocalDb/user_local_date.dart';
import 'package:http/http.dart' as http;
import '../../Controllers/PhoneNumberController/phone_number_controller.dart';
import '../../Utils/LocalDb/phone_contacts.dart';

class PhoneNumbersBloc extends Bloc<PhoneNumberEvent, PhoneNumberState>{


  PhoneNumbersBloc() : super(PhoneNumberInitialState()){
    on<GetPhoneNumbers>(getPhoneNumbers);
  }


  FutureOr<void> getPhoneNumbers(GetPhoneNumbers event, Emitter<PhoneNumberState> emit)async{

    List<Contact>? _contacts;
    bool _permissionDenied = false;
    var list = [];
    var map = Map();
    var token = "";
    PhoneContacts phoneContacts = PhoneContacts();

    Network network = Network();
    UserData userData = UserData();

    final contactNo = await userData.getUserContact();

    final controller = Get.put(PhoneNumberController());
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      _permissionDenied = true;
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      _contacts = contacts;

      for(int i=0; i < _contacts.length; i++)
      {
        if(_contacts![i].phones.isNotEmpty && _contacts[i].phones != null)
        {

          if(_contacts[i].phones.first.number.length > 4)
            {
              String numberWithWhiteSpaces = _contacts![i].phones.first.number;
              String filterNumberForWhiteSpace = numberWithWhiteSpaces.replaceAll(' ', '');



              if(filterNumberForWhiteSpace.startsWith('+') || filterNumberForWhiteSpace.startsWith('00'))
              {
                controller.fetchNumbers(filterNumberForWhiteSpace);
              }
              else
              {
                final phoneNumber = await PhoneNumberUtil().parse(contactNo);
                var filter;
                if(filterNumberForWhiteSpace.startsWith('0'))
                {
                  filter = filterNumberForWhiteSpace.substring(1);
                }
                String addCountryCode = "+${phoneNumber.countryCode}$filter";
                controller.fetchNumbers(addCountryCode);
              }
            }
        }
      }



      for(int i=0; i < controller.numberList!.length; i++)
        {
          var singleMap = Map();
          singleMap['phoneNumber'] = controller.numberList[i].toString();
          list.add(singleMap);
        }




      token =await userData.getUserToken();


      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = jsonEncode({
        "contacts" : list,
      });

      try
      {
        final result = await network.getPosthWithHeader(AppUrls.getContactUrl, body, header);

        for(var data in result['data']['registeredUsers'])
          {
            phoneContacts.addContact(data['avatar'], data['_id'], data['phoneNumber']);
          }
      }
      catch(e){
        print(e.toString());
      }

    }

  }

}