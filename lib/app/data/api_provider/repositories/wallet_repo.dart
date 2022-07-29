import 'package:dio/dio.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';

class WalletRepo {
  Future<num> getWalletBalance() async {
    try {
      Response r = await ApiClient().dio.get("/wallet");
      return r.data["data"]["wallet"]["balance"];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
