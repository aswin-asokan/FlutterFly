import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:task5/variables.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final _DBbox = Hive.box('DBbox');

  void resetPassword(String email, String newPassword) {
    var userData = _DBbox.get(email);
    if (userData != null) {
      userData[2] = newPassword; // Assuming password is stored at index 2
      _DBbox.put(email, userData);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password reset successfully",
              style: GoogleFonts.urbanist())));
      Navigator.pop(context); // Navigate back to the login page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User not found", style: GoogleFonts.urbanist())));
    }
  }

  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: height * 0.15, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_nobg.png", height: 150),
            SizedBox(
              height: 15,
            ),
            Text(
              "Reset Password",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: Icon(Icons.mail_rounded),
                  ),
                  prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
                  hintText: "Mail ID",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintStyle: GoogleFonts.urbanist(color: Colors.black)),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              onChanged: (value) {
                passNotifier.value = PasswordStrength.calculate(text: value);
              },
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: Icon(Icons.lock),
                  ),
                  prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
                  hintText: "New Password",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintStyle: GoogleFonts.urbanist(color: Colors.black)),
            ),
            SizedBox(height: 20),
            PasswordStrengthChecker(
              strength: passNotifier,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(252, 151, 142, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  String email = emailController.text.toString();
                  String newPassword = newPasswordController.text.toString();
                  resetPassword(email, newPassword);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    child: Text("Reset Password",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
