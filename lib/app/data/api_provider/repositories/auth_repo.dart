import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/helpers/exceptions.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/image_repo.dart';
import 'package:we_fast_driver_panel/app/modules/step_selector/controllers/step_selector_controller.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import '../../../services/common_loader/common_loader.dart';

class AuthRepo {
  sendOtp({required String mobile}) async {
    CommonLoader.showLoading();
    var data = {"phoneNumber": mobile};
    try {
      Response r = await ApiClient().dio.post("/driver/login", data: data);
      if (r.statusCode == 200) {
        CommonLoader.hideLoading();
        g.Get.toNamed(Routes.OTP);
      }
    } on BadRequestException {
      CommonLoader.showErrorDialog(description: "Invalid Mobile Number");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  verifyOtp({required String mobile, required String otp}) async {
    CommonLoader.showLoading();
    var data = {"phoneNumber": mobile, "otp": otp};
    try {
      Response r = await ApiClient().dio.post("/driver/login-otp", data: data);
      if (r.statusCode == 200) {
        await _saveToken(r.data["data"]["loginToken"]);
        await saveIfDocumentUploaded(
            r.data["data"][areDocumentsUploadedString]);
        await saveIfVehicleRegistered(
            r.data["data"][isVehicleRegisteredString]);
        //g.Get.offNamed(Routes.ADD_VEHICLE_DETAILS);
        bool isVehicleRegistered = r.data["data"][isVehicleRegisteredString];
        bool areDocumentUploaded = r.data["data"][areDocumentsUploadedString];
        if (isVehicleRegistered == false) {
          g.Get.offNamed(Routes.ADD_VEHICLE_DETAILS);
        } else if (areDocumentUploaded == false) {
          g.Get.offNamed(Routes.STEP_SELECTOR);
        } else if (areDocumentUploaded == true && isVehicleRegistered == true) {
          g.Get.offNamed(Routes.BOTTOM_NAV_BAR);
        }
      }
    } on BadRequestException {
      CommonLoader.showErrorDialog(description: "Invalid OTP");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  putProfileImage({required String imagePath}) async {
    CommonLoader.showLoading();
    try {
      String imageUrl = await ImageRepo().upload(imagePath: imagePath);
      var data = {"imageUrl": imageUrl};
      Response r = await ApiClient().dio.put("driver/profile-image",data: data);
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Image Uploaded");
      }
    } on BadRequestException {
      CommonLoader.showErrorDialog(description: "Invalid Image");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  addDocuments(
      {required String aadharId,
      required String rcNumber,
      required String driverLicenseNumber,
      required String insuranceNumber,
      required List<XFile> aadharImages,
      required XFile dlImage,
      required List<XFile> insuraceImages,
      required XFile rcImage}) async {
    CommonLoader.showLoading();
    try {
      List<String> aadharImageUrls = [];
      aadharImages.forEach((element) async {
        aadharImageUrls.add(await ImageRepo().upload(imagePath: element.path));
      });
      String dlImageUrl = await ImageRepo().upload(imagePath: dlImage.path);
      List<String> insuranceImageUrls = [];
      insuraceImages.forEach((element) async {
        insuranceImageUrls
            .add(await ImageRepo().upload(imagePath: element.path));
      });
      String rcImageUrl = await ImageRepo().upload(imagePath: rcImage.path);
      var data = {
        "aadhaarOrVoterCard": aadharImageUrls,
        "driverLicense": dlImageUrl,
        "vehicleInsurance": insuranceImageUrls,
        "vehicleRc": rcImageUrl,
        "aadhaarOrVoterCardNumber": aadharId,
        "vehicleRcNumber": rcNumber,
        "driverLicenseNumber": driverLicenseNumber,
        "vehicleInsuranceNumber": insuranceNumber
      };
      Response r = await ApiClient().dio.post("/document/register", data: data);
      if (r.statusCode == 200) {
        StepSelectorController selectorController = g.Get.find();
        selectorController.selectedStep.value = 2;
        selectorController.documentsUploaded = true;
        saveIfDocumentUploaded(true);
        g.Get.offNamed(Routes.STEP_SELECTOR);
      }
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  static _saveToken(String token) async {
    GetStorage box = GetStorage();
    await box.write(tokenString, token);
  }

  static saveIfDocumentUploaded(bool areDocumentUploaded) async {
    GetStorage box = GetStorage();
    await box.write(areDocumentsUploadedString, areDocumentUploaded);
  }

  static saveIfVehicleRegistered(bool ifVehicleRegistered) async {
    GetStorage box = GetStorage();
    await box.write(isVehicleRegisteredString, ifVehicleRegistered);
  }
}
