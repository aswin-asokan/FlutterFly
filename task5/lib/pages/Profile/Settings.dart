import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/variables.dart';
import 'package:task5/widgets/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

final _DBbox = Hive.box('DBbox');
void write(var name, var email, var pass, var phn, var img, var add) {
  _DBbox.put(email, [name, email, pass, phn, img, add]);
}

class _SettingsState extends State<Settings> {
  String img = imageS;
  TextEditingController name = TextEditingController(text: nameS);
  TextEditingController mail = TextEditingController(text: mailS);
  TextEditingController pass = TextEditingController(text: passwordS);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.09, left: 25, right: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Settings",
                    style: GoogleFonts.urbanist(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
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
                    height: 20,
                  ),
                  customTextField(name, "Name", const Icon(Icons.person)),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextField(mail, "Mail", const Icon(Icons.mail)),
                  const SizedBox(
                    height: 15,
                  ),
                  customPassField(pass, true),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(252, 151, 142, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        if (name.text.isNotEmpty &&
                            pass.text.isNotEmpty &&
                            mail.text.isNotEmpty) {
                          if (!EmailValidator.validate(mail.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Enter a valid Email")));
                          } else {
                            setState(() {
                              nameS = name.text;
                              mailS = mail.text;
                              passwordS = pass.text;
                              imageS = img;
                              write(nameS, mailS, passwordS, mobileS, imageS,
                                  address);
                            });

                            // Indicate that settings were updated
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Settings Saved")));
                            setState(() {});
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Navigate(3),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Fill all fields")));
                        }
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text("Save Settings",
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
        ),
      ),
    );
  }
}
