 
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';

class UploadDocumentController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController vehicleRcNumber = TextEditingController();
  TextEditingController driversLicense = TextEditingController();
  TextEditingController vehicleInsurance = TextEditingController();
  TextEditingController aadharOrVoter = TextEditingController();
  Rx<XFile> rcImage = XFile("").obs;
  Rx<XFile> licenseImage = XFile("").obs;
  RxList<XFile> insurnaceImage = <XFile>[].obs;
  RxList<XFile> aadharOrVoterImage = <XFile>[].obs;
  pickImage(Rx<XFile> image) async {
    ImagePicker picker = ImagePicker();
    var temp = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (temp != null) {
      image.value = temp;
    }
  }

  pickMultiImage(RxList<XFile> images) async {
    ImagePicker picker = ImagePicker();
    List<XFile>? temp = await picker.pickMultiImage();
    if (temp != null) {
      images.value = temp;
    }
  }

  callUploadDocumentApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.addDocuments(
        aadharId: aadharOrVoter.text,
        rcNumber: vehicleRcNumber.text,
        driverLicenseNumber: driversLicense.text,
        insuranceNumber: vehicleInsurance.text,
        aadharImages: aadharOrVoterImage,
        dlImage: licenseImage.value,
        insuraceImages: insurnaceImage,
        rcImage: rcImage.value);
  }

  @override
  void dispose() {
    key.currentState!.dispose();
    vehicleRcNumber.dispose();
    driversLicense.dispose();
    vehicleInsurance.dispose();
    aadharOrVoter.dispose();
    super.dispose();
  }
}
