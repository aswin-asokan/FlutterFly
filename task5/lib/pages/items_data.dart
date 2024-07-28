import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Item {
  final String imagePath;
  final String title;
  final String description;
  final String category;
  final double price;
  final List<Widget> imageList;

  Item(this.imagePath, this.title, this.description, this.category, this.price,
      this.imageList);
}

List<Item> menItems = [
  Item(
    "assets/images/Screenshot from 2024-07-21 13-55-23.png",
    "Essential's Men's Short Sleeve",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList("assets/images/Screenshot from 2024-07-21 13-55-23.png"),
      imageList("assets/images/Screenshot from 2024-07-21 13-55-31.png")
    ],
  ),
  // Add more items
];

List<Item> womenItems = [
  Item(
    "assets/images/Screenshot from 2024-07-21 18-45-22.png",
    "GoSriKi Women Kurta with Pant & Dupatta",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList("assets/images/Screenshot from 2024-07-21 13-55-23.png"),
      imageList("assets/images/Screenshot from 2024-07-21 13-55-31.png")
    ],
  ),
];

List<Item> kidsItems = [
  // Add kids items
];
