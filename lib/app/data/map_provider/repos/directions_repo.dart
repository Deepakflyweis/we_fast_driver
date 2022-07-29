import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/map_models/directions_model.dart';
import '../map_client.dart';

class DirectionsRepo {
  Future<DirectionsModel> getDirections(
      {required LatLng origin, required LatLng destination}) async {
    try {
      String destString = destination.latitude.toString() +
          "," +
          destination.longitude.toString();
      String orgString =
          origin.latitude.toString() + "," + origin.longitude.toString();
      Response r = await MapClient()
          .dio
          .get("/directions/json?destination=$destString&origin=$orgString");
      if (r.statusCode == 200) {
        return directionsModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.data["status"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
