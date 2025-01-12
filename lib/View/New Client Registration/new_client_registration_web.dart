import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/Component/Forms/info_form_one.dart';
import 'package:bright_weddings/Component/Forms/info_form_two.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/footer.dart';
import '../../Helper/colors.dart';
import '../../Controller/new_registration_controller.dart';

class NewClientRegistrationWeb extends StatelessWidget {
  const NewClientRegistrationWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final NewRegistrationController controller = Get.find<NewRegistrationController>();

    return Scaffold(
      appBar: Header(
        onBack: ()=>Get.back(),
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children:[
          Obx(() {
          return ListView(
            children: [
              SizedBox(
                height: 4.0.h,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: controller.currentFormIndex.value == 0
                          ? Offset(1, 0)
                          : Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: controller.currentFormIndex.value == 0
                    ? InfoFormOne(onNext: () {
                  controller.currentFormIndex.value = 1;
                })
                    : InfoFormTwo(onBack: () {
                  controller.currentFormIndex.value = 0;
                }),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Footer(),
            ],
          );
        }),
          Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: AssetImage(
                'assets/images/leaves.png',
              ),
              height: 17.h,
              width: 28.w,
            ),
          ),
        ],

      ),
    );
  }
}
