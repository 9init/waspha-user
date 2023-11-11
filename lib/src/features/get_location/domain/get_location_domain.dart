import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getUserLocation = StateProvider<LatLng>((ref) {
  return LatLng(0.0, 0.0);
});
final getUserLocationTempProvider = StateProvider<LatLng>((ref) {

  return LatLng(0.0, 0.0);
});
final isPickingLocationProvider = StateProvider<bool>((ref) {
  return false;
});
