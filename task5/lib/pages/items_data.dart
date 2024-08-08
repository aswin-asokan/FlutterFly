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
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/Screenshot%20from%202024-07-21%2013-55-23.png",
    "Essential's Men's Short Sleeve\n",
    "Essential's",
    "Step into timeless style with our Classic Fit Cotton Shirt, a wardrobe essential that blends comfort with elegance. Crafted from premium, breathable cotton, this shirt is designed to keep you cool and comfortable all day long.",
    "Shirt",
    1200,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/Screenshot%20from%202024-07-21%2013-55-23.png"),
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/Screenshot%20from%202024-07-21%2013-55-31.png"),
    ],
  ),
  Item(
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/71WBVg0YE8L._SX569_.jpg",
    "Van Heusen Men's Solid Polo T Regular Fit Shirt\n",
    "Van Heusen",
    "The minimal detailing, flattering fit and fine cotton fabric ensure it will be a weekend favorite.",
    "Shirt",
    599,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/71WBVg0YE8L._SX569_.jpg"),
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/71ZG4Uqu5EL._SX569_.jpg"),
    ],
  ),
  Item(
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/71x4rLhMkML._SY741_.jpg",
    "Lymio Men T-Shirt || T-Shirt for Men || Plain T Shirt || T-Shirt (Polo-18-21)\n",
    "Lymio",
    "Men T-Shirt || T-Shirt for Men || Plain T Shirt || T-Shirt",
    "Shirt",
    349,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/71x4rLhMkML._SY741_.jpg"),
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/61BgTz16eTL._SY741_.jpg"),
    ],
  ),
  Item(
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/710Wq4cILqL._SY741_.jpg",
    "Lymio Track Pant for Men || Track Pants || Plain Track Pant (Track-06-08)\n",
    "Lymio",
    "Track Pant for Men || Track Pants",
    "Shirt",
    419,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/710Wq4cILqL._SY741_.jpg"),
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/men/610IIi6wHuL._SY741_.jpg"),
    ],
  ),
];

List<Item> womenItems = [
  Item(
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/women/Screenshot%20from%202024-07-21%2018-45-22.png",
    "GoSriKi Women Kurta with Pant & Dupatta\n",
    "Shop",
    "",
    "Shirt",
    1200,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/women/Screenshot%20from%202024-07-21%2018-45-22.png"),
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/women/Screenshot%20from%202024-07-21%2018-45-09.png"),
    ],
  ),
  Item(
    "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/women/Screenshot%20from%202024-07-28%2015-06-29.png",
    "Women Kurtha\n",
    "Shop",
    "Step into timeless style with our Classic Fit Cotton Kurtha",
    "Saree",
    1500,
    [
      imageList(
          "https://raw.githubusercontent.com/aswin-asokan/FlutterFly/main/task5/assets/images/women/Screenshot%20from%202024-07-28%2015-06-29.png"),
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
