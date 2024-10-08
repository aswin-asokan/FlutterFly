import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/pages/shop/items.dart';

Widget ItemCard(String path, String shop, String about, String category,
    String name, double prize, double w, List<Widget> images, var context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Items(name, shop, about, path, category, prize, images),
        ),
      );
    },
    child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(26, 88, 85, 85),
              blurRadius: 2,
              spreadRadius: 3,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white54,
          ),
          width: w * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  path,
                  height: w * 0.3,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.urbanist(color: Colors.black38),
                    ),
                    Text(name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ $prize",
                          style: GoogleFonts.urbanist(),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
  );
}
