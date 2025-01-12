import 'package:bright_weddings/Component/Buttons/hollow_button.dart';
import 'package:bright_weddings/Component/Buttons/submit_button.dart';
import 'package:bright_weddings/Component/TextFields/input_field.dart';
import 'package:bright_weddings/Controller/new_registration_controller.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/path_constants.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoFormOne extends StatelessWidget {
  final VoidCallback onNext;

  InfoFormOne({super.key, required this.onNext});

  final NewRegistrationController controller =
      Get.find<NewRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 130.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3.h),
            width: 35.w,
            decoration: BoxDecoration(
                color: Color(0xFFFFFAA0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Now",
                  style: GoogleFonts.playfairDisplay(
                      color: textColor, fontSize: 1.8.t),
                ),
                Text(
                  "Find\nyour life\npartner",
                  style: GoogleFonts.playfairDisplay(
                      color: textColor,
                      fontSize: 2.8.t,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Easy and fast.",
                  style: GoogleFonts.playfairDisplay(
                      color: textColor, fontSize: 1.8.t),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Image.asset(
                  loginCouplePNG,
                  width: 240,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 17.0.w),
            children: [
              Text(
                "ADD NEW ONE",
                style: GoogleFonts.poppins(fontSize: 1.2.t, color: textColor),
              ),
              Text(
                "Get on to the Journey",
                style: GoogleFonts.playfairDisplay(
                    fontSize: 2.4.t, color: Color(0xFF333333)),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Divider(
                color: borderColor,
              ),
              SizedBox(
                height: 1.3.h,
              ),
              Text(
                "Name:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Full Name",
                  controller: controller.nameController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Birthdate:",
                      style: GoogleFonts.poppins(
                        fontSize: 0.9.t,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Obx(()=>HollowButton(title: controller.formattedDate.value, onTap: (){
                      controller.pickDate(context);
                    }, height: 3.0.h, width: 15.0.w),)
                  ],
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Upload photo:",
                      style: GoogleFonts.poppins(
                        fontSize: 0.9.t,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                      Obx(()=>HollowButton(title: controller.selectedFileName.value, onTap: (){
                        controller.pickFile(FileType.image);
                      }, height: 3.0.h, width: 17.0.w),)
                  ],
                ),
              ],
                            ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Cast:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Cast",
                  controller: controller.castController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Subcast:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Subcast",
                  controller: controller.subCastController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "Devak:",
                style: GoogleFonts.poppins(
                  fontSize: 0.9.t,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              InputField(
                  labelText: "Enter Devak",
                  controller: controller.devakController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 1.5.h,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              SubmitButton(title: "Save & next", onTap: onNext)
            ],
          ))
        ],
      ),
    );
  }
}
