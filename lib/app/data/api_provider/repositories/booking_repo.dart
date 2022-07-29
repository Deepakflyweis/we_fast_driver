import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';
import 'package:we_fast_driver_panel/app/modules/orders/controllers/orders_controller.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/app/services/common_loader/common_loader.dart';

class BookingRepo {
  Future<List<BookingModel>> getPreviousBooking() async {
    try {
      Response r = await ApiClient().dio.get("/booking");
      return bookingModelFromJson(jsonEncode(r.data["data"]["bookings"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<BookingModel>> getBookingSuggestion() async {
    try {
      Response r = await ApiClient().dio.get("/booking/suggestions");
      return bookingModelFromJson(jsonEncode(r.data["data"]["bookings"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<BookingModel> getBookingById({required String bookingId}) async {
    try {
      Response r = await ApiClient().dio.get("/booking/$bookingId");
      return BookingModel.fromJson(r.data["data"]["booking"]);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> acceptBooking({required String bookingId}) async {
    try {
      CommonLoader.showLoading();
      Response r = await ApiClient().dio.post("/booking/$bookingId/accept");
      CommonLoader.showSuccessDialog(description: "Booking Accepted");
      await Future.delayed(Duration(seconds: 2));
      g.Get.find<OrdersController>().callGetBookingSuggestionApi();
      g.Get.offNamedUntil(Routes.BOTTOM_NAV_BAR, (route) => false);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }
}
