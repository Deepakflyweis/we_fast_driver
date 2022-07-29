import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/booking_repo.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/vehicle_repo.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/vehicle_type_model.dart';

class OrderDetailsController extends GetxController
    with StateMixin<BookingModel> {
  String bookingId = Get.arguments;
  late VehicleTypeModel vehicleTypeModel;
  @override
  void onInit() {
    callGetBookingById();
    super.onInit();
  }

  callGetBookingById() {
    BookingRepo bookingRepo = BookingRepo();
    bookingRepo.getBookingById(bookingId: bookingId).then((value) async {
      try {
        vehicleTypeModel =
            await VehicleRepo().getVehicleTypeById(id: value.vehicleType);
      } catch (err) {
        change(null, status: RxStatus.error());
      }
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

  callAcceptBookingApi() {
    BookingRepo bookingRepo = BookingRepo();
    bookingRepo.acceptBooking(bookingId: bookingId);
  }
}
