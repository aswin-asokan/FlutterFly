import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:task5/widgets/iamgeslide.dart';

Widget homeTop(double height, double width) {
  return Stack(
    children: [
      Container(
        alignment: Alignment.center,
        child: ImageSlideshow(
          width: double.infinity,
          height: height * 0.5,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          children: [
            imageSlide("assets/images/downloadfile-5.jpg",
                "Empower Your Elegance,", "Define Your Style.", Colors.white),
            imageSlide("assets/images/downloadfile-6.jpg",
                "Redefine Your Style", "Elevate Your Presence.", Colors.white),
          ],
          onPageChanged: (value) {},
          autoPlayInterval: 7000,
          isLoop: true,
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              Badge(
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_sharp)),
                isLabelVisible: false,
              ),
            ],
          ))
    ],
  );
}
