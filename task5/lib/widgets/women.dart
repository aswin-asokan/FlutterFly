import 'package:flutter/material.dart';
import 'package:task5/widgets/itemcard.dart';

Widget Women(double width, var context) {
  return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.4,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 5.0,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 6.0,
      children: [
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About", "Shirt",
            "Essential's Men's Short Sleeve\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-5.jpg", "Puma", "About",
            "category", "name\n", 12, width, context)
      ]);
}
