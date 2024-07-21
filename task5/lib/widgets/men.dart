import 'package:flutter/material.dart';
import 'package:task5/widgets/itemcard.dart';
import 'package:task5/widgets/widgets.dart';

Widget Men(double width, var context) {
  var size = MediaQuery.of(context).size;
  return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: .7,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 10.0,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 6.0,
      children: [
        ItemCard(
            "assets/images/Screenshot from 2024-07-21 13-55-23.png",
            "Shop",
            "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
            "Shirt",
            "Essential's Men's Short Sleeve\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-23.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-31.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-21 13-55-23.png",
            "Shop",
            "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
            "Shirt",
            "Essential's Men's Short Sleeve\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-23.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-31.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-21 13-55-23.png",
            "Shop",
            "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
            "Shirt",
            "Essential's Men's Short Sleeve\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-23.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-31.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-21 13-55-23.png",
            "Shop",
            "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
            "Shirt",
            "Essential's Men's Short Sleeve\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-23.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 13-55-31.png"),
            ],
            context),
      ]);
}
