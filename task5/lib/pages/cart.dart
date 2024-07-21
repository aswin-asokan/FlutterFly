import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/widgets/cartwidget.dart';
import 'package:task5/variables.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var cartItems = [
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
                  "My Cart",
                  style: GoogleFonts.urbanist(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Cartwidget(
                        cartItems[index][0].toString(),
                        cartItems[index][1].toString(),
                        cartItems[index][2].toString(),
                        double.parse(cartItems[index][3].toString()),
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
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(250, 234, 235, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Prize: ",
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ " + totPrize.toString(),
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width * 0.9, 50),
                    backgroundColor: Color.fromRGBO(252, 151, 142, 1)),
                onPressed: () {},
                child: Text(
                  "Check Out",
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
