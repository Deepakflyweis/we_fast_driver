import 'package:dio/dio.dart';

import '../api_client.dart';
import '../helpers/exceptions.dart';

class ImageRepo {
  Future<String> upload({required String imagePath}) async {
    var data =
        FormData.fromMap({"image": await MultipartFile.fromFile(imagePath)});
    Response r = await ApiClient().dio.post("/image-upload", data: data);
    return r.data["data"]["image"];
  }
}
