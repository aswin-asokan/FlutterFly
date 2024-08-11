import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_strength/password_strength.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:task5/widgets/widgets.dart';

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
      appBar: customBack(context, ""),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: height * 0.1, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_nobg.png", height: 150),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Reset Password",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: Icon(Icons.mail_rounded),
                  ),
                  prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                  hintText: "Mail ID",
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintStyle: GoogleFonts.urbanist(color: Colors.black)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              onChanged: (value) {
                passNotifier.value = PasswordStrength.calculate(text: value);
              },
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: Icon(Icons.lock),
                  ),
                  prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                  hintText: "New Password",
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintStyle: GoogleFonts.urbanist(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            PasswordStrengthChecker(
              strength: passNotifier,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(252, 151, 142, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  String email = emailController.text.toString();
                  String newPassword = newPasswordController.text.toString();
                  var strength = estimatePasswordStrength(newPassword);
                  if (strength == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Choose a Strong Password")));
                  } else {
                    (email, newPassword);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
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
