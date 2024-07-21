import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/pages/home.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
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
        padding: EdgeInsets.only(top: height * 0.2, left: 25, right: 25),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 1.png", height: 100),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Text(
                "Login to your Account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: email,
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
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: pass,
                obscureText: passObscure,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.lock),
                    ),
                    prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
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
                    suffixIconColor: Color.fromRGBO(48, 45, 45, 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 15),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style:
                            TextStyle(fontSize: 15, color: Colors.blueAccent),
                      ))
                ],
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
                    setState(() {
                      em = email.text.toString();
                      ps = pass.text.toString();
                    });
                    var data = _DBbox.get(em);
                    if (data != null) {
                      if (data[2] != ps) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password error")));
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigate(),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User not found")));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      child: Text("Register Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
