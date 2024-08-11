import 'package:flutter/material.dart';
import 'package:task5/pages/listItems/items_data.dart';
import 'package:task5/widgets/itemcard.dart';

Widget Women(double width, var context) {
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    childAspectRatio: .7,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 5.0,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 6.0,
    children: womenItems
        .map((item) => ItemCard(
            item.imagePath,
            item.shop,
            item.description,
            item.category,
            item.title,
            item.price,
            width,
            item.imageList,
            context))
        .toList(),
  );
}
