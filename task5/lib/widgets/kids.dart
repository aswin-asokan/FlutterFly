import 'package:flutter/material.dart';
import 'package:task5/widgets/itemcard.dart';
import 'package:task5/widgets/widgets.dart';

Widget kids(double width, var context) {
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
            "assets/images/Screenshot from 2024-07-21 19-36-50.png",
            "Shop",
            "Material composition60/40 Cotton Polyester\nFit typeRegular Fit\nSleeve typeHalf Sleeve\nCollar styleCollarless\nLengthStandard Length\nNeck styleDom\nCountry of OriginIndia",
            "T-Shirt",
            "Allen Solly Boys Regular Fit Tshirt\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-36-50.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-37-02.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-28 15-07-13.png",
            "Shop",
            "Material composition60/40 Cotton Polyester\nFit typeRegular Fit\nSleeve typeHalf Sleeve\nCollar styleCollarless\nLengthStandard Length\nNeck styleDom\nCountry of OriginIndia",
            "T-Shirt",
            "Allen Solly Boys Regular Fit Tshirt\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-36-50.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-37-02.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-28 15-07-28.png",
            "Shop",
            "Material composition60/40 Cotton Polyester\nFit typeRegular Fit\nSleeve typeHalf Sleeve\nCollar styleCollarless\nLengthStandard Length\nNeck styleDom\nCountry of OriginIndia",
            "T-Shirt",
            "Allen Solly Boys Regular Fit Tshirt\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-36-50.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-37-02.png"),
            ],
            context),
        ItemCard(
            "assets/images/Screenshot from 2024-07-28 15-07-45.png",
            "Shop",
            "Material composition60/40 Cotton Polyester\nFit typeRegular Fit\nSleeve typeHalf Sleeve\nCollar styleCollarless\nLengthStandard Length\nNeck styleDom\nCountry of OriginIndia",
            "T-Shirt",
            "Allen Solly Boys Regular Fit Tshirt\n",
            1200,
            width,
            [
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-36-50.png"),
              imageList(
                  "assets/images/Screenshot from 2024-07-21 19-37-02.png"),
            ],
            context),
      ]);
}
