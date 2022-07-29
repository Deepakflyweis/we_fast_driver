import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/vehicle_type_model.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_vertical.dart';
import 'package:we_fast_driver_panel/app/widgets/drop_downs/rec_drop_down.dart';
import 'package:we_fast_driver_panel/app/widgets/text_feilds/rec_textFeild.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_string.dart';
import '../../../widgets/buttons/rounded_gradient_button.dart';
import '../controllers/add_vehicle_details_controller.dart';

class AddVehicleDetailsView extends GetView<AddVehicleDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    elevation: 3,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            AppLogoVertical(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Obx(() => InkWell(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: ClipOval(
                                      child: controller.image.value.path == ""
                                          ? Image.asset(
                                              "assets/images/user.png",
                                              width: 8.h,
                                            )
                                          : Image.file(
                                              controller.image.value,
                                              width: 8.h,
                                            ),
                                    ),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  uploadProfilePicture,
                                  style: primary10Style,
                                ),
                                Icon(
                                  Icons.upload,
                                  size: 15.sp,
                                  color: grey400,
                                )
                              ],
                            ),
                            RecTextFeild(
                                msg: enterVehicleNumber,
                                hint: enterVehicleNumberHint,
                                controller: controller.vehicleNumber,
                                validator: (val) {
                                  if (val == "") {
                                    return enterVehicleNumber;
                                  }
                                }),
                            RecTextFeild(
                                msg: vehicleOwnerName,
                                hint: vehicleOwnerNameHint,
                                controller: controller.name,
                                validator: (val) {
                                  if (val == "") {
                                    return enter + " " + vehicleOwnerName;
                                  }
                                }),
                            RecTextFeild(
                                msg: mobileNumber,
                                hint: mobileNumberHint,
                                controller: controller.mobileNumber,
                                keyboradType: TextInputType.phone,
                                validator: (val) {
                                  if (val!.length != 10) {
                                    return enter + " " + mobileNumber;
                                  }
                                }),
                            controller.obx(
                              (state)=> RecDropdownButton(
                                  value: controller.selectedVehicleType.value,                                
                                  hint: Text(type),
                                  onChanged: (val) {
                                    controller.selectedVehicleType.value = val;
                                  },
                                  msg: vehicleType,
                                  items: state!
                                      .map((e) => DropdownMenuItem<VehicleTypeModel>(
                                          value: e, child: Text(e.name)))
                                      .toList(),
                                  validator: (val) {
                                    if (val == null) {
                                      return select + " " + vehicleType;
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundedGradientButton(
                                title: submit,
                                gradient: primayGradientVertical,
                                onTap: () {
                                  if (controller.key.currentState!.validate() &&
                                      controller.image.value.path != "") {
                                    //Get.toNamed(Routes.STEP_SELECTOR);
                                    controller.callAddVehicleApi();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'version'.tr + ' ' + versionCode,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
