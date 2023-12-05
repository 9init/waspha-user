import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

LocationData _defaultLocation = LocationData.fromMap({
  "latitude": 30.0444,
  "longitude": 31.2357,
});

Future<LocationData> getLocation() async {
  if (!await Permission.location.isGranted) {
    return _defaultLocation;
  }

  final location = Location();
  bool _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return _defaultLocation;
    }
  }

  // Solve emulator issue (iOS)
  return await Future.any([
    () async {
      _defaultLocation = await location.getLocation();
      return _defaultLocation;
    }(),
    Future.delayed(
      Duration(seconds: 2),
      () => _defaultLocation,
    ),
  ]);
}

void _determinePosition(
    StreamController<location.LocationData> streamController) async {
  streamController.add(await getLocation());
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
