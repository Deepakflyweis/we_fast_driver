import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';
import 'package:we_fast_driver_panel/constants/translations.dart';

class ProfileController extends GetxController {
  Map<String, String>? currentLanguage;

  @override
  void onInit() {
    //todo implement get profile api
    super.onInit();
  }

  findAppLanguage() {
    var currentLocale = Get.locale;
    print(currentLocale);
  }

  changeProfilePic() async {
    ImagePicker imagePicker = ImagePicker();
    var tempImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      AuthRepo authRepo = AuthRepo();
      authRepo.putProfileImage(imagePath: tempImage.path);
    }
  }

  changeAppLanguage(Map<String, String> val) {
    // Get.updateLocale(l);
  }
}
