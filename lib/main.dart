import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'constants/translations.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await GetStorage.init();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translationsKeys: AppTranslation.translationsKeys,
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }));
  }
}
