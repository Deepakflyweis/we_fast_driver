import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/vehicle_repo.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/vehicle_type_model.dart';

class AddVehicleDetailsController extends GetxController
    with StateMixin<List<VehicleTypeModel>> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  Rx<File> image = File("").obs;
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  Rx<VehicleTypeModel?> selectedVehicleType = (null as VehicleTypeModel?).obs;
  //List<String> vehicleTypes = ["Car", "Bike"];

  pickImage() async {
    ImagePicker picker = ImagePicker();
    var temp = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (temp != null) {
      await _cropImage(temp.path);
    }
  }

  _cropImage(filePath) async {
    ImageCropper imageCropper = ImageCropper();
    File? croppedImage = await imageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      await _callUploadImageApi(croppedImage.path);
      image.value = croppedImage;
    }
  }

  _callUploadImageApi(String imagePath) {
    AuthRepo authRepo = AuthRepo();
    authRepo.putProfileImage(imagePath: imagePath);
  }

  callAddVehicleApi() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.addVehicle(
        vehicleNumber: vehicleNumber.text,
        name: name.text,
        vehicleTypeId: selectedVehicleType.value!.id,
        phoneNumber: mobileNumber.text);
  }

  _callGetVehicleTypeApi() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.getVehicleType().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  @override
  void dispose() {
    name.dispose();
    vehicleNumber.dispose();
    mobileNumber.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    _callGetVehicleTypeApi();
    super.onInit();
  }
}
