import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/booking_repo.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/wallet_repo.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';
import 'package:we_fast_driver_panel/app/modules/home/controllers/home_controller.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';

class AccountController extends GetxController with StateMixin {
  late num walletBalance;
  List<BookingModel> bookings = [];

  @override
  void onInit() {
    callGetApi();
    super.onInit();
  }

  callGetApi() {
    Future.wait([
      WalletRepo().getWalletBalance(),
      BookingRepo().getPreviousBooking()
    ]).then((value) {
      walletBalance = value[0] as num;
      bookings.addAll(value[1] as List<BookingModel>);
      _passValuesToHomeScreen();
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  _passValuesToHomeScreen() {
    HomeController homeController = Get.find();
    homeController.earnings(walletBalance.toString());
    homeController.bookingCount(bookings.length.toString());
    int canCount = 0;
    for (var item in bookings) {
      if (item.status == cancelled) {
        canCount++;
      }
    }
    homeController.tripsCancelled(canCount.toString());
  }
}
