import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';

class PersonLocationProvider extends ChangeNotifier {
  PersonLocationProvider() {
    _init();
  }

  final location.Location _location = location.Location();

  location.PermissionStatus _permissionGranted =
      location.PermissionStatus.denied;

  StreamController<location.LocationData> currentLocation =
      StreamController.broadcast();

  // Future<void> _checkPermission() async {
  //   _permissionGranted = await _location.hasPermission();
  //   if (_permissionGranted == location.PermissionStatus.denied) {
  //     _permissionGranted = await _location.requestPermission();
  //     if (_permissionGranted != location.PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  // }

  Future<void> _init() async {
    currentLocation.add(await getLocation());
  }
}

Future<LocationData> getLocation() async {
  if (!await Permission.location.isGranted) {
    return LocationData.fromMap({
      "latitude": 30.0444,
      "longitude": 31.2357,
    });
  }

  Location location = new Location();

  bool _serviceEnabled;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return LocationData.fromMap({
        "latitude": 30.0444,
        "longitude": 31.2357,
      });
    }
  }

  _locationData = await Future.any([
    location.getLocation(),
    Future.delayed(
        Duration(seconds: 5),
        () => LocationData.fromMap({
              "latitude": 30.0444,
              "longitude": 31.2357,
            })),
  ]);
  return _locationData;
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
