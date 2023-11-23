import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _pickupRadiusKey = 'pickupRadius';

  // Getter for pickupRadius
  static Future<double?> getPickupRadius() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_pickupRadiusKey);
  }

  // Setter for pickupRadius
  static Future<void> setPickupRadius(double radius) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_pickupRadiusKey, radius);
  }
}

class PickupRadiusProvider extends ChangeNotifier {
  static const double _defaultPickupRadius = 15;

  double? _pickupRadius;
  double? _tempPickupRadius;

  // Getter for pickupRadius with a default value of 15
  double get pickupRadius => _pickupRadius ?? _defaultPickupRadius;
  double get tempPickupRadius => _tempPickupRadius ?? _defaultPickupRadius;

  // Setter for pickupRadius
  Future<void> setPickupRadius(int radius) async {
    _tempPickupRadius = radius.toDouble();
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
