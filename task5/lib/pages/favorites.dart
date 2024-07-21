import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/widgets/cartwidget.dart';
import 'package:task5/widgets/favwidget.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  var favItems = [
    [
      "assets/images/downloadfile-6.jpg",
      "Essential's Men's Short Sleeve",
      "L",
      1200
    ],
    [
      "assets/images/downloadfile-5.jpg",
      "Essential's Women's Short Sleeve",
      "L",
      1500
    ]
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.06, left: 25, right: 25),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "My Favorites",
                  style: GoogleFonts.urbanist(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: favItems.length,
                    itemBuilder: (context, index) {
                      return Favwidget(
                        favItems[index][0].toString(),
                        favItems[index][1].toString(),
                        favItems[index][2].toString(),
                        double.parse(favItems[index][3].toString()),
                      );
                    }),
                SizedBox(
                  height: height * 0.2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
