import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/booking_repo.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';

class OrdersController extends GetxController
    with StateMixin<List<BookingModel>> {
  @override
  void onInit() {
    callGetBookingSuggestionApi();
    super.onInit();
  }

  callGetBookingSuggestionApi() async {
    change(null, status: RxStatus.loading());
    BookingRepo bookingRepo = BookingRepo();
    bookingRepo.getBookingSuggestion().then((value) {
      if (value.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
