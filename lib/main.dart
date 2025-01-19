import 'package:bright_weddings/View/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'controller/screen_controller.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'View/Profile/ProfileDetails/profile_details.dart';
import 'View/Profile/ProfileDetails/profile_details.dart';
import 'Helper/size_config.dart';  // Import SizeConfig

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ScreenController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
            SizeConfig.init(constraints, orientation);  // Initialize SizeConfig
            return GetMaterialApp(
              title: "Bright Weddings",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                primaryColor: Color(0xFFF3D48A),
              ),
              routes: {
                '/': (context) => LoginPage(),
                '/home': (context) => ProfileDetails(),
              },
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}
