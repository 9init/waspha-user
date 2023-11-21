import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart';

class PersonLocationProvider extends ChangeNotifier {
  PersonLocationProvider() {
    _init();
  }

  final location.Location _location = location.Location();
  location.PermissionStatus _permissionGranted =
      location.PermissionStatus.denied;
  StreamController<location.LocationData> currentLocation =
      StreamController.broadcast();

  Future<void> _checkPermission() async {
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == location.PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> _init() async {
    // await _checkPermission();

    final locationData = await Future.any([
      _location.getLocation(),
      Future.delayed(
        Duration(microseconds: 1500), // One second and half
        () => location.LocationData.fromMap({
          'latitude': 30.0444,
          'longitude': 31.2357,
        }),
      ),
    ]);

    currentLocation.add(locationData);
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
