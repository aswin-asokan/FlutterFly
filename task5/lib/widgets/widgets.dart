import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imageList(String path) {
  return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Image.asset(fit: BoxFit.cover, path));
}

////////////////////////////////////////////////////////////////////////////////

//Profile button
Widget profileIcon(String head, String sub, var context, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    head,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sub,
                    overflow: TextOverflow.ellipsis,
                    style:
                        GoogleFonts.urbanist(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
Widget customTextField(TextEditingController name, String hint, Icon ic) {
  return TextField(
    controller: name,
    decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 5),
          child: ic,
        ),
        prefixIconColor: Color.fromRGBO(48, 45, 45, 1),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        hintStyle: GoogleFonts.urbanist(color: Colors.black)),
  );
}

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
class customPassField extends StatefulWidget {
  TextEditingController pass;
  bool passObscure;
  customPassField(this.pass, this.passObscure, {super.key});

  @override
  State<customPassField> createState() => _customPassFieldState();
}

class _customPassFieldState extends State<customPassField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.pass,
      obscureText: widget.passObscure,
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
                    widget.passObscure = !widget.passObscure;
                  });
                },
                icon: Icon(widget.passObscure
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ),
          suffixIconColor: Color.fromRGBO(48, 45, 45, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          hintStyle: GoogleFonts.urbanist(color: Colors.black)),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
