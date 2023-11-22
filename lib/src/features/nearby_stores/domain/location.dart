import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

Future<LocationData> getLocation() async {
  final defaultLocation = LocationData.fromMap({
    "latitude": 30.0444,
    "longitude": 31.2357,
  });

  if (!await Permission.location.isGranted) {
    return defaultLocation;
  }

  final location = Location();
  bool _serviceEnabled = await location.serviceEnabled();

  if (!_serviceEnabled && !(await location.requestService())) {
    return defaultLocation;
  }

  // Solve emulator issue (iOS)
  return await Future.any([
    location.getLocation(),
    Future.delayed(
      Duration(seconds: 2),
      () => defaultLocation,
    ),
  ]);
}

void _determinePosition(
    StreamController<location.LocationData?> streamController) async {
  Timer.periodic(Duration(seconds: 5), (_) async {
    final result = await getLocation();
    streamController.add(result);
  });
}

final locationStreamProvider = StreamProvider<location.LocationData>(
  (ref) {
    final streamController = StreamController<location.LocationData>();
    _determinePosition(streamController);
    return streamController.stream;
  },
);

Future<bool> isLocationGranted() async {
  return await Permission.location.isGranted;
}
