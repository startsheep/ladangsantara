import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ladangsantara/app/services/local_storage_service.dart';
import 'package:ladangsantara/app/themes/theme.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Get.putAsync(
    () => SpUtil.getInstance(),
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LadangSantara",
      initialRoute:
          LocalStorage.getIsUserLoggedIn == true ? Routes.CORE : Routes.AUTH,
      getPages: AppPages.routes,
      theme: ThemeApp.defaultTheme,
    ),
  );
  FlutterNativeSplash.remove();
}
