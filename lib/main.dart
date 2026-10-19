import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
// ignore: unused_import
import 'package:greengrocer/src/pages/auth/view/sign_in_screen.dart';
import 'package:greengrocer/src/pages/home/controller/home_controller.dart';
// ignore: unused_import
import 'package:greengrocer/src/pages/splash/splash_screen.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LifeGreen',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: PagesRoutes.splashRoute,

      getPages: AppPages.pages,
    );
  }
}
