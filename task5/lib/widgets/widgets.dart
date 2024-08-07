import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imageList(String path) {
  return ClipRRect(
      borderRadius: const BorderRadius.only(
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
          const SizedBox(
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
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
          const Divider(
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
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: ic,
        ),
        prefixIconColor: const Color.fromRGBO(48, 45, 45, 1),
        hintText: hint,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(252, 151, 142, 1))),
        border: const OutlineInputBorder(
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
                    widget.passObscure = !widget.passObscure;
                  });
                },
                icon: Icon(widget.passObscure
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ),
          suffixIconColor: const Color.fromRGBO(48, 45, 45, 1),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          hintStyle: GoogleFonts.urbanist(color: Colors.black)),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
