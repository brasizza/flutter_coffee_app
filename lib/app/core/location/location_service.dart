import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:howabout_coffee/app/core/exceptions/user_denied_location.dart';

class LocationService {
  LocationPermission? permission;
  StreamSubscription<Position>? positionStream;
  late LocationSettings locationSettings;

  Future<void> init() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      return Future.error(UserDeniedLocation('Denied'));
    } else {
      permission = await Geolocator.checkPermission();
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
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, timeLimit: const Duration(seconds: 2));
      return position;
    } else {
      return null;
    }
  }

  double calculateDistance(double lat, double lng, Position position) {
    final distance = Geolocator.distanceBetween(lat, lng, position.latitude, position.longitude);
    print(distance);
    return distance;
  }
}
