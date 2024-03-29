import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  LocationPermission? permission;
  Future<void> getLocation() async {
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      if (permission == LocationPermission.unableToDetermine) {
        // Permissions are denied forever, handle appropriately.
        return Future.error('unableToDetermine.');
      }
      if (permission == LocationPermission.always) {
        // Permissions are denied forever, handle appropriately.
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        debugPrint('got it');
      }
    } catch (e) {
      print(e);
    }
  }
}
