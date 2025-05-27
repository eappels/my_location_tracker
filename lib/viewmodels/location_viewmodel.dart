import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationViewModel extends ChangeNotifier {

  Future<void> updateLocation() async {

    var location = Location();
    location.onLocationChanged.listen((LocationData mycurrentLocation) {
      _currentLocation = mycurrentLocation;
      notifyListeners();
    });

    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await location.getLocation();
    notifyListeners();

    location.onLocationChanged.listen((LocationData newLocation) {
      _currentLocation = newLocation;
      debugPrint('Location changed: ${newLocation.latitude}, ${newLocation.longitude}');
      notifyListeners();
    });
  }

  LocationData? _currentLocation;
  LocationData? get currentLocation => _currentLocation;
}