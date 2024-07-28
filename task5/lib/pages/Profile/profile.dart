import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:task5/login.dart';
import 'package:task5/pages/Profile/EditProfile.dart';
import 'package:task5/pages/Profile/Settings.dart';
import 'package:task5/pages/orders.dart';
import 'package:task5/variables.dart';
import 'package:task5/widgets/widgets.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _DBbox = Hive.box('DBbox');
  @override
  Widget build(BuildContext context) {
    var data = _DBbox.get(mailS);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Profile",
                        style: GoogleFonts.urbanist(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.logout_rounded))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          data[4],
                          height: width * 0.3,
                          width: width * 0.3,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.5,
                            child: Text(
                              maxLines: 1,
                              data[0],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.urbanist(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: width * 0.5,
                            child: Text(
                              maxLines: 1,
                              data[1],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.urbanist(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  profileIcon(
                      "Settings", "Edit your preferences", context, Settings()),
                  profileIcon(
                      "My Orders", "View your orders", context, Orders()),
                  profileIcon("Saved Addresses", "Change delivery address",
                      context, Editprofile()),
                  profileIcon("Payment Methods", "Saved credit/debit cards",
                      context, Editprofile()),
                  profileIcon("Terms and Conditions",
                      "Terms, Policies, and Licenses", context, Editprofile()),
                  profileIcon(
                      "About", "Know more about us", context, Editprofile()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
