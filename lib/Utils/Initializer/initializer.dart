


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_wave/Bloc/FcmTokenBloc/fcm_token_events.dart';


import '../../Bloc/FcmTokenBloc/fcm_token_bloc.dart';
import '../../Bloc/PhoneNumbersBloc/phone_number_event.dart';
import '../../Bloc/PhoneNumbersBloc/phone_numbers_bloc.dart';

import '../NotificationServices/notification_services.dart';

class Initializer{


  initialize(BuildContext context)async
  {
    print("initialized ****************************************");
    BlocProvider.of<PhoneNumbersBloc>(context).add(GetPhoneNumbers());
    FcmTokenBloc().add(SaveFcmToken());
  }



}