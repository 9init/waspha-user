import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart';

class PersonLocationProvider extends ChangeNotifier {
  PersonLocationProvider() {
    _init();
  }
  location.Location _location = new location.Location();
  location.PermissionStatus _permissionGranted =
      location.PermissionStatus.denied;
  StreamController<location.LocationData> currentLocation =
      StreamController.broadcast();

  _checkPermission() async {
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == location.PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
  }

  _init() {
    _checkPermission();
    currentLocation.addStream(_location.onLocationChanged);
  }
}

final locationProvider = ChangeNotifierProvider<PersonLocationProvider>((ref) {
  return PersonLocationProvider();
});

final locationStreamProvider =
    StreamProvider.autoDispose<location.LocationData>(
  (ref) {
    ref.keepAlive();
    final stream = ref.read(locationProvider).currentLocation.stream;

    return stream;
  },
);

Future<bool> isLocationGranted() async {
  return await Permission.location.isGranted;
}
