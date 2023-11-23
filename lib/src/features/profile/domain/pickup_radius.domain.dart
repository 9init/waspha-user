import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _pickupRadiusKey = 'pickupRadius';

  // Getter for pickupRadius
  static Future<int?> getPickupRadius() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_pickupRadiusKey);
  }

  // Setter for pickupRadius
  static Future<void> setPickupRadius(int radius) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_pickupRadiusKey, radius);
  }
}

class PickupRadiusProvider extends ChangeNotifier {
  static const int _defaultPickupRadius = 15;

  int? _pickupRadius;
  int? _tempPickupRadius;

  // Getter for pickupRadius with a default value of 15
  int get pickupRadius => _pickupRadius ?? _defaultPickupRadius;
  int get tempPickupRadius => _tempPickupRadius ?? _defaultPickupRadius;

  // Setter for pickupRadius
  Future<void> setPickupRadius(int radius) async {
    _tempPickupRadius = radius;
    notifyListeners();
  }

// Setter for pickupRadius
  Future<void> savePickupRadius() async {
    _pickupRadius = _tempPickupRadius;
    PreferencesService.setPickupRadius(pickupRadius);
    notifyListeners();
  }

  // Initialize the pickupRadius value
  Future<void> init() async {
    _pickupRadius = await PreferencesService.getPickupRadius();
    _tempPickupRadius = _tempPickupRadius;
    notifyListeners();
  }
}

final pickupRadiusProvider =
    ChangeNotifierProvider.autoDispose<PickupRadiusProvider>(
  (ref) => PickupRadiusProvider()..init(),
);
