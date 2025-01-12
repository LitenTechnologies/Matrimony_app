import 'package:bright_weddings/Component/Dashboard/image_card.dart';
import 'package:bright_weddings/Helper/colors.dart';
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentSuccess extends StatelessWidget {
  final List<Map<String, dynamic>> userList;

  RecentSuccess({required this.userList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 45.0.h,
      width: 48.0.w,
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
        itemCount: userList.length > 6 ? 6 : userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 10.w, // Adjusted width to make it more visible
                  height: 10.w, // Made height and width proportional
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageCard(imageUrl: user['image_url']), // Corrected the usage
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user['full_name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 1.1.t,
                        color: textColor
                      ),
                    ),
                    Text(
                      user['address'],
                      style: GoogleFonts.poppins(
                        color: textColor,
                          fontSize: 1.t,
                      )
                    ),
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
