import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/helpers/exceptions.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/vehicle_type_model.dart';
import 'package:we_fast_driver_panel/app/services/common_loader/common_loader.dart';
import 'package:get/get.dart' as g;

import '../../../routes/app_pages.dart';

class VehicleRepo {
  addVehicle(
      {required String vehicleNumber,
      required String name,
      required String vehicleTypeId,
      required String phoneNumber}) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "vehicleNumber": vehicleNumber,
        "name": name,
        "vehicleType": vehicleTypeId,
        "phone_number": phoneNumber
      };
      Response r = await ApiClient().dio.post("/vehicle", data: data);
      if (r.statusCode == 200) {
        CommonLoader.hideLoading();
        AuthRepo.saveIfVehicleRegistered(true);
        g.Get.toNamed(Routes.STEP_SELECTOR);
      }
    } on BadRequestException {
      CommonLoader.showErrorDialog(description: "Invalid Data");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<List<VehicleTypeModel>> getVehicleType() async {
    try {
      Response r = await ApiClient().dio.get("/vehicle-type");
      if (r.statusCode == 200) {
        return vehicleTypeModelFromJson(
            jsonEncode(r.data["data"]["vehicleTypes"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on BadRequestException {
      return Future.error("Error Getting Vehicle Type");
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<VehicleTypeModel> getVehicleTypeById({required String id}) async {
    try {
      Response r = await ApiClient().dio.get("/vehicle-type/$id");
      if (r.statusCode == 200) {
        return VehicleTypeModel.fromJson(r.data["data"]["vehicleType"]);
      } else {
        return Future.error(r.data["error"]);
      }
    } on BadRequestException {
      return Future.error("Error Getting Vehicle Type");
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
