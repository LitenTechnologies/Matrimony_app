import 'package:bright_weddings/Component/Dashboard/circular_bullet.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Helper/colors.dart';
import '../../../Mock API/user_list.dart';
import '../image_card.dart';

class ProfileListTab extends StatelessWidget {
  const ProfileListTab({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(8.w),
      width: screenWidth*0.7,
      height: screenHeight*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth*0.15,
                  height: screenHeight*0.15, // Made height and width proportional
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageCard(
                      imageUrl: user['image_url']), // Corrected the usage
                ),
                SizedBox(height: 1.0.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user['full_name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 2.0.t,
                              color: textColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['address'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.5.t,
                            )),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['age'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.5.t,
                            )),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['education'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.5.t,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Row(
                      children: [
                        CircularBullet(),
                        SizedBox(width: 0.5.w,),
                        Text(user['demands'],
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 1.5.t,
                            )),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 3.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width: 1)
                            ),
                            child: Center(
                              child: Text('View Full Profile',style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 1.1.t
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0.w,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 3.5.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                              child: Text('Get matches',style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 1.1.t
                              ),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },

        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Divider(
              color: Color(0xFFE7E7E7),
              thickness: 1,
            ),
          );
        },
      ),
    );
  }
}
