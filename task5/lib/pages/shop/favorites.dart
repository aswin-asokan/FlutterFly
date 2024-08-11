import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/widgets/favwidget.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var favItems = [];
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.06, left: 25, right: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "My Favorites",
                  style: GoogleFonts.urbanist(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                favItems.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: favItems.length,
                        itemBuilder: (context, index) {
                          return Favwidget(
                            favItems[index][0].toString(),
                            favItems[index][1].toString(),
                            favItems[index][2].toString(),
                            double.parse(favItems[index][3].toString()),
                          );
                        })
                    : Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                            child: Image.asset("assets/images/nothing.png")),
                      ),
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
