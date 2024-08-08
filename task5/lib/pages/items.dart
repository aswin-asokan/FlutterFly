import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:task5/variables.dart';

class Items extends StatefulWidget {
  final String name, path, category, shop, about;
  final double prize;
  List<Widget> images;
  Items(this.name, this.shop, this.about, this.path, this.category, this.prize,
      this.images,
      {super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late String size;
  final cartBox = Hive.box('Cart');

  void write(String email, List cartItems) {
    cartBox.put(email, cartItems);
    print('Updated cart items for $email: ${cartBox.get(email)}');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Fetch existing cart items for the current user
    List cartItems = cartBox.get(mailS, defaultValue: []);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 234, 235, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ImageSlideshow(
                          width: double.infinity,
                          height: height * 0.5,
                          initialPage: 0,
                          indicatorColor: Colors.blue,
                          indicatorBackgroundColor: Colors.grey,
                          onPageChanged: (value) {},
                          autoPlayInterval: 6000,
                          isLoop: true,
                          children: widget.images,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 35,
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 35,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.storefront_outlined),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.shop),
                          ],
                        ),
                        Text(
                          widget.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "About Item",
                          style: GoogleFonts.urbanist(color: Colors.pinkAccent),
                        ),
                        const Divider(
                          color: Colors.pinkAccent,
                        ),
                        Text(widget.about),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total Prize:",
                      style: GoogleFonts.urbanist(fontSize: 15),
                    ),
                    Text(
                      "₹ ${widget.prize}",
                      style: GoogleFonts.urbanist(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  color: const Color.fromRGBO(252, 151, 142, 1),
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Choose Size",
                                          style: GoogleFonts.urbanist(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        OverflowBar(
                                          alignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            TextButton(
                                              child: Text('Large',
                                                  style: GoogleFonts.urbanist(
                                                      fontSize: 16)),
                                              onPressed: () {
                                                setState(() {
                                                  size = "L";
                                                });
                                                cartItems.add({
                                                  'path': widget.path,
                                                  'name': widget.name,
                                                  'size': size,
                                                  'prize': widget.prize,
                                                  'count': 1,
                                                });
                                                write(mailS, cartItems);
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        duration:
                                                            Durations.short4,
                                                        content: Text(
                                                            "Added to Cart")));
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Medium',
                                                style: GoogleFonts.urbanist(
                                                    fontSize: 16),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  size = "M";
                                                });
                                                cartItems.add({
                                                  'path': widget.path,
                                                  'name': widget.name,
                                                  'size': size,
                                                  'prize': widget.prize,
                                                  'count': 1,
                                                });
                                                write(mailS, cartItems);
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        duration:
                                                            Durations.short4,
                                                        content: Text(
                                                            "Added to Cart")));
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Small',
                                                  style: GoogleFonts.urbanist(
                                                      fontSize: 16)),
                                              onPressed: () {
                                                setState(() {
                                                  size = "S";
                                                });
                                                cartItems.add({
                                                  'path': widget.path,
                                                  'name': widget.name,
                                                  'size': size,
                                                  'prize': widget.prize,
                                                  'count': 1,
                                                });
                                                write(mailS, cartItems);
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        duration:
                                                            Durations.short4,
                                                        content: Text(
                                                            "Added to Cart")));
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(Icons.shopping_bag)),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 50),
                          elevation: 0,
                          minimumSize: const Size(50, 50),
                          maximumSize: const Size(120, 50),
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          "Buy Now",
                          style: GoogleFonts.urbanist(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
