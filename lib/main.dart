import 'package:bright_weddings/View/Login/login.dart';
import 'package:bright_weddings/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:bright_weddings/Helper/get_di.dart' as di;
import 'Helper/size_config.dart';
import 'View/Profile/ProfileDetails/profile_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          SizeConfig.init(constraints, orientation);
          return GetMaterialApp(
              title: "Bright Weddings",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3D48A)),
                primaryColor: Color(0xFFF3D48A),
              ),

              home: LoginPage(),
              debugShowCheckedModeBanner: false, // Disable debug banner her
              builder: EasyLoading.init());
        },
      );
    });
  }
}
