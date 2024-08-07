import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:task5/pages/checkout.dart';
import 'package:task5/widgets/cartwidget.dart';
import 'package:task5/variables.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final cartBox = Hive.box('Cart');
  final orderBox = Hive.box('Orders');

  void writeOrder(String email, List orderItems) {
    orderBox.put(email, orderItems);
    print('Updated order items for $email: ${orderBox.get(email)}');
  }

  List orderItems = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Retrieve cart items for the specific user, ensure it's not null
    List<dynamic> cartItems = cartBox.get(mailS, defaultValue: []);

    // Calculate total prize
    double totalPrize = 0;

    for (int x = 0; x < cartItems.length; x++) {
      final item = cartItems[x];
      if (item != null &&
          item.containsKey('prize') &&
          item.containsKey('count')) {
        totalPrize += (item['prize'] * item['count']) ??
            0; // Ensure item['prize'] is not null
      }
      print('Updated cart items for $mailS: ${cartBox.get(mailS)}');
    }

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
                  "My Cart",
                  style: GoogleFonts.urbanist(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                cartItems.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Cartwidget(
                            item['path'] ?? '',
                            item['name'] ?? '',
                            item['size'] ?? '',
                            item['prize'] ?? 0,
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
      bottomSheet: Container(
        decoration: const BoxDecoration(
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
              const SizedBox(
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
                    "₹  ${totalPrize.toStringAsFixed(2)}",
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width * 0.9, 50),
                    backgroundColor: const Color.fromRGBO(252, 151, 142, 1)),
                onPressed: () {
                  if (cartItems.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Checkout(totalPrize, cartItems),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 500),
                        content: Text("Cart is Empty",
                            style: GoogleFonts.urbanist())));
                  }
                },
                child: Text(
                  "Check Out",
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
