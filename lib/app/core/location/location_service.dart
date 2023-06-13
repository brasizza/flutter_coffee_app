import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:howabout_coffee/app/core/exceptions/user_denied_location.dart';

class LocationService {
  LocationPermission? permission;
  StreamSubscription<Position>? positionStream;
  late LocationSettings locationSettings;

  Future<void> init() async {
    bool enabled = true;
    try {
      enabled = await Geolocator.isLocationServiceEnabled();
    } on MissingPluginException catch (_) {
      enabled = true;
    }
    if (!enabled) {
      return Future.error(UserDeniedLocation('Denied'));
    } else {
      try {
        permission = await Geolocator.checkPermission();
      } on MissingPluginException catch (_) {
        permission = LocationPermission.always;
      }
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error(UserDeniedLocation('Denied'));
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(UserDeniedLocation('Denied'));
      }
    }
  }

  Future<Position?> currentPosition() async {
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, timeLimit: const Duration(seconds: 10));
      return position;
    } else {
      return null;
    }
  }

  double calculateDistance(double lat, double lng, Position position) {
    final distance = Geolocator.distanceBetween(lat, lng, position.latitude, position.longitude);
    return distance;
  }
}
