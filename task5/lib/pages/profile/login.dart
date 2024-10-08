import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/pages/profile/forgotPass.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/pages/profile/register.dart';
import 'package:task5/variables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool passObscure = true;
  late String mailID, password;
  final _DBbox = Hive.box('DBbox');

  @override
  Widget build(BuildContext context) {
    String? em, ps;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: height * 0.15, left: 25, right: 25),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_nobg.png", height: 150),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Welcome Back",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Text(
                "Login to your Account",
                style: GoogleFonts.urbanist(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: email,
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
                controller: pass,
                obscureText: passObscure,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.lock),
                    ),
                    prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Password",
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              passObscure = !passObscure;
                            });
                          },
                          icon: Icon(passObscure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                    suffixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintStyle: GoogleFonts.urbanist(color: Colors.black)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Checkbox(
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: GoogleFonts.urbanist(fontSize: 15),
                  ),
                  const Spacer(),*/
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.urbanist(
                            fontSize: 15, color: Colors.blueAccent),
                      ))
                ],
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
                    setState(() {
                      em = email.text.toString();
                      ps = pass.text.toString();
                    });
                    var data = _DBbox.get(em);
                    if (data != null) {
                      if (data[2] != ps) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Password error",
                                style: GoogleFonts.urbanist())));
                      } else {
                        password = data[2];
                        setState(() {
                          nameS = data[0];
                          mailS = data[1];
                          passwordS = data[2];
                          mobileS = data[3];
                          imageS = data[4];
                          address = data[5];
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Navigate(0),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("User not found",
                              style: GoogleFonts.urbanist())));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Register Now",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
