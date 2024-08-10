import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:task5/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController phn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  final _DBbox = Hive.box('DBbox');
  void write(var name, var email, var pass, var phn, var img, var add) {
    _DBbox.put(email, [name, email, pass, phn, img, add]);
  }

  String img = "assets/images/downloadfile-7.jpg";
  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    String? n, e, p, ph, i, a;

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: height * 0.01, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Register your account",
                style: GoogleFonts.urbanist(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text("Choose Image",
                                    style: GoogleFonts.urbanist(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          img =
                                              'assets/images/downloadfile-7.jpg';
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: ClipOval(
                                        child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/downloadfile-7.jpg",
                                          height: width * 0.4,
                                          width: width * 0.4,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          img =
                                              'assets/images/downloadfile-8.jpg';
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: ClipOval(
                                        child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/downloadfile-8.jpg",
                                          height: width * 0.4,
                                          width: width * 0.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset(
                      fit: BoxFit.cover,
                      img,
                      height: width * 0.45,
                      width: width * 0.45,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.person),
                    ),
                    prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Name",
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
                controller: phn,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.phone_android),
                    ),
                    prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Mobile Number",
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
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.mail),
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
                controller: address,
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.house),
                    ),
                    prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Address",
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
                    hintText: "Password",
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
                    setState(() {
                      if (name.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          pass.text.isNotEmpty &&
                          address.text.isNotEmpty &&
                          phn.text.isNotEmpty) {
                        if (!EmailValidator.validate(email.text.toString())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter a valid Email")));
                        } else {
                          n = name.text.toString();
                          e = email.text.toString();
                          p = pass.text.toString();
                          ph = phn.text.toString();
                          a = address.text.toString();
                          i = img;
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Fill all fields")));
                      }
                    });
                    write(n, e, p, ph, i, a);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Register",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("Cancel",
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
