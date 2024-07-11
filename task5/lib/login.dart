import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  late String mailID, password;
  final _DBbox = Hive.box('DBbox');
  @override
  Widget build(BuildContext context) {
    String? em, ps;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Text(
                "Login to your account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
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
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
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
                        Navigator.popAndPushNamed(context, '/home');
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
                      child: Text("Login now",
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
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
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
