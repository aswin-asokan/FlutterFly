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

