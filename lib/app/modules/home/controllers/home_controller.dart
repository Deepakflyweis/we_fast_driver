import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../data/map_provider/repos/directions_repo.dart';

class HomeController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Rx<String> bookingCount = "-".obs;
  Rx<String> earnings = "-".obs;
  Rx<String> tripsCancelled = "-".obs;

  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;

  setPolylines(
      {required LatLng pickUpLocation, required LatLng dropLocation}) async {
    allMarkers
        .add(Marker(markerId: MarkerId("Pick Up"), position: pickUpLocation));
    allMarkers.add(Marker(markerId: MarkerId("Drop"), position: dropLocation));
    allMarkers.refresh();
    DirectionsRepo directionsRepo = DirectionsRepo();
    directionsRepo
        .getDirections(origin: pickUpLocation, destination: dropLocation)
        .then((value) async {
      if (value.routes.isNotEmpty) {
        polylines.add(Polyline(
            geodesic: true,
            polylineId: const PolylineId("polyline0"),
            color: Colors.blue,
            width: 5,
            points: PolylinePoints()
                .decodePolyline(value.routes.first.overviewPolyline.points)
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList()));
        var gc = await mapController.future;
        gc.animateCamera(CameraUpdate.newLatLngBounds(
            LatLngBounds(
                southwest: LatLng(value.routes.first.bounds.southwest.lat,
                    value.routes.first.bounds.southwest.lng),
                northeast: LatLng(value.routes.first.bounds.northeast.lat,
                    value.routes.first.bounds.northeast.lng)),
            20.sp));
      }
      polylines.refresh();
    });
  }
}
