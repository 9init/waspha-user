import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAddressLocation {

  double savedLatitude = 0.0;
  double savedLongitude = 0.0;
  String savedAddress = '';
}
