
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../Bloc/InternetConnectivityBloc/internet_connectivity_bloc.dart';
import '../../Bloc/InternetConnectivityBloc/internet_connectivity_events.dart';



class NetworkHelper {

  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}