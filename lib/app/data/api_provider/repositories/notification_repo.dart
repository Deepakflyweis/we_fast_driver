import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/helpers/exceptions.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/notification_model.dart';

class NotificationRepo {
  Future<List<NotificationModel>> getNotification() async {
    try {
      Response r = await ApiClient().dio.get("/notification");
      if (r.statusCode == 200) {
        return notificationModelFromJson(
            jsonEncode(r.data["data"]["notifications"]));
      } else {
        return Future.error("Invalid Requiest");
      }
    } on BadRequestException {
      return Future.error("Invalid Requiest");
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
