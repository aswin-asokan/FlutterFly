import 'package:flutter/material.dart';

Widget imageSlide(String path, String h, String t, Color c) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 20),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: h + "\n",
                    style: TextStyle(
                        fontSize: 27, color: c, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: t,
                    style: TextStyle(
                        fontSize: 20, color: c, fontWeight: FontWeight.w400)),
              ]),
            )),
      ));
}
