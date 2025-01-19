import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bright_weddings/View/Login/login.dart';
import 'package:bright_weddings/View/New Client Registration/new_client_registration.dart';
import 'package:bright_weddings/View/Dashboard/dashboard.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool? showDashboard;
  final bool? showLogin;
  final bool? showRegistration;

  Header({
    Key? key,
    this.onNext,
    this.onBack,
    this.showDashboard,
    this.showLogin,
    this.showRegistration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Section
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  if (onBack != null)
                    IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                  if (onNext != null)
                    IconButton(
                      onPressed: onNext,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      "BRIGHT WEDDINGS",
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Right Section
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (showLogin ?? true)
                      _buildStyledButton(
                        text: 'Logout',
                        onPressed: () {
                          Get.offAll(() => LoginPage());
                        },
                        startColor: Colors.redAccent,
                        endColor: Colors.deepOrangeAccent,
                        icon: Icons.exit_to_app,
                      ),
                    if (showRegistration ?? true)
                      _buildStyledButton(
                        text: 'Register',
                        onPressed: () {
                          Get.to(() => NewClientRegistration());
                        },
                        startColor: Colors.greenAccent,
                        endColor: Colors.lightGreen,
                        icon: Icons.person_add,
                      ),
                    if (showDashboard ?? true)
                      _buildStyledButton(
                        text: 'Dashboard',
                        onPressed: () {
                          Get.to(() => Dashboard());
                        },
                        startColor: Colors.blueAccent,
                        endColor: Colors.lightBlue,
                        icon: Icons.dashboard,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required String text,
    required VoidCallback onPressed,
    required Color startColor,
    required Color endColor,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, endColor],
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12.0,
                offset: Offset(4, 4), 
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0), // Reduced vertical padding
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 20.0),
                SizedBox(width: 8.0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
