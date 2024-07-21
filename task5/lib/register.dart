import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:task5/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = new TextEditingController();
  TextEditingController phn = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  final _DBbox = Hive.box('DBbox');
  void write(var name, var email, var pass) {
    _DBbox.put(email, [name, email, pass]);
  }

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    String? n, e, p;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: height * 0.05, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 1.png", height: 100),
              SizedBox(
                height: 15,
              ),
              Text(
                "Register your account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.person),
                    ),
                    prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Name",
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
                controller: phn,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.phone_android),
                    ),
                    prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
                    hintText: "Mobile Number",
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
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Icon(Icons.mail),
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
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 20),
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
                    setState(() {
                      if (name.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          pass.text.isNotEmpty &&
                          phn.text.isNotEmpty) {
                        if (!EmailValidator.validate(email.text.toString())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter a valid Email")));
                        } else {
                          n = name.text.toString();
                          e = email.text.toString();
                          p = pass.text.toString();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Fill all fields")));
                      }
                    });
                    write(n, e, p);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      child: Text("Register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      child: Text("Cancel",
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
