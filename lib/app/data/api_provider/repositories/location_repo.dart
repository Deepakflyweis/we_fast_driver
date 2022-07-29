import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';

class LocationRepo {
  Future<void> updateUserLocation() async {
    try {
      Location location = Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      var data = {
        "coordinates": [_locationData.longitude, _locationData.latitude]
      };
      Response r = await ApiClient().dio.put("/location", data: data);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
