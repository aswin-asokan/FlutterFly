import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:task5/login.dart';
import 'package:task5/pages/Profile/EditProfile.dart';
import 'package:task5/variables.dart';
import 'package:task5/widgets/widgets.dart';

class Profile extends StatefulWidget {
  String mail;
  Profile(this.mail, {super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final _DBbox = Hive.box('DBbox');

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var data = _DBbox.get(widget.mail);
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.06, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            setState(() {
                              remember = false;
                            });
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
                      "Profile", "Edit your profile", context, Editprofile()),
                  profileIcon(
                      "My Orders", "View your orders", context, Editprofile()),
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
