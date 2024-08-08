import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Item {
  String imagePath;
  String title;
  String shop;
  String description;
  String category;
  double price;
  List<Widget> imageList;

  Item(this.imagePath, this.title, this.shop, this.description, this.category,
      this.price, this.imageList);
}

List<Item> menItems = [
  Item(
    "assets/images/Screenshot from 2024-07-21 13-55-23.png",
    "Essential's Men's Short Sleeve",
    "Shop",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList("assets/images/Screenshot from 2024-07-21 13-55-23.png"),
      imageList("assets/images/Screenshot from 2024-07-21 13-55-31.png"),
    ],
  ),
  Item(
    "assets/images/Screenshot from 2024-07-21 13-55-23.png",
    "Essential's Men's Short Sleeve",
    "Shop",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList("assets/images/Screenshot from 2024-07-21 13-55-23.png"),
      imageList("assets/images/Screenshot from 2024-07-21 13-55-31.png")
    ],
  ),
];

List<Item> womenItems = [
  Item(
    "assets/images/Screenshot from 2024-07-21 18-45-22.png",
    "GoSriKi Women Kurta with Pant & Dupatta",
    "Shop",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList("assets/images/Screenshot from 2024-07-21 13-55-23.png"),
      imageList("assets/images/Screenshot from 2024-07-21 13-55-31.png")
    ],
  ),
  Item(
    "assets/images/women/young-indian-woman-wearing-sari (2).jpg",
    "Women Saree",
    "Shop",
    "Step into timeless style with our Classic Fit Cotton Saree",
    "Saree",
    1500,
    [
      imageList("assets/images/women/young-indian-woman-wearing-sari (1).jpg"),
      imageList("assets/images/women/young-indian-woman-wearing-sari (2).jpg"),
      imageList("assets/images/women/young-indian-woman-wearing-sari.jpg")
    ],
  ),
];

List<Item> kidItems = [
  Item(
      "assets/images/Screenshot from 2024-07-21 19-36-50.png",
      "Allen Solly Boys Regular Fit Tshirt\n",
      "Shop",
      "Material composition60/40 Cotton Polyester\nFit typeRegular Fit\nSleeve typeHalf Sleeve\nCollar styleCollarless\nLengthStandard Length\nNeck styleDom\nCountry of OriginIndia",
      "T-Shirt",
      1200, [
    imageList("assets/images/Screenshot from 2024-07-21 19-36-50.png"),
    imageList("assets/images/Screenshot from 2024-07-21 19-37-02.png"),
  ])
];
