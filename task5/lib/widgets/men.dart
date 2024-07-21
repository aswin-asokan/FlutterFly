import 'package:flutter/material.dart';
import 'package:task5/widgets/itemcard.dart';

Widget Men(double width, var context) {
  return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.4,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 5.0,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 6.0,
      children: [
        ItemCard(
            "assets/images/downloadfile-6.jpg",
            "Shop",
            "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
            "Shirt",
            "Essential's Men's Short Sleeve\n",
            1200,
            width,
            context),
        ItemCard("assets/images/downloadfile-6.jpg", "Shop", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context),
        ItemCard("assets/images/downloadfile-6.jpg", "Puma", "About",
            "category", "name\n", 12, width, context)
      ]);
}
