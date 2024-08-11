import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/variables.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Checkout extends StatefulWidget {
  final double prize;
  final List<dynamic> cartItems;
  String page;
  Checkout(this.prize, this.cartItems, this.page, {super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

int _selectedValue = 1;

class _CheckoutState extends State<Checkout> {
  final cartBox = Hive.box('Cart');
  final orderBox = Hive.box('Orders');

  void writeOrder(String email, List orderItems) {
    // Retrieve existing orders
    List existingOrders = orderBox.get(email) ?? [];
    // Add new order items to existing orders
    existingOrders.addAll(orderItems);
    // Write the updated list back to the box
    orderBox.put(email, existingOrders);
    print('Updated order items for $email: ${orderBox.get(email)}');
  }

  void clearCart(String email) {
    cartBox.put(email, []);
    print('Cleared cart items for $email: ${cartBox.get(email)}');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    double deliver = 50;
    double prize = widget.prize;
    double total = deliver + prize;
    List<dynamic> cartItems = widget.cartItems;
    List<dynamic> orderItems = [];

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: height * 0.06, left: 25, right: 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check Out",
                style: GoogleFonts.urbanist(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address",
                          style: GoogleFonts.urbanist(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(address, style: GoogleFonts.urbanist(fontSize: 20)),
                      TextButton(
                          onPressed: () {},
                          child: Text("Change Address",
                              style: GoogleFonts.urbanist(fontSize: 20)))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Payment",
                style: GoogleFonts.urbanist(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/cash-on-delivery.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Cash on Delivery'),
                  ],
                ),
                value: 1,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/google-pay.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Google Pay'),
                  ],
                ),
                value: 2,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/paytm.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Paytm'),
                  ],
                ),
                value: 3,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/amazon-pay.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Amazon Pay'),
                  ],
                ),
                value: 4,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Order Summary",
                style: GoogleFonts.urbanist(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order: ",
                    style: GoogleFonts.urbanist(
                        fontSize: 18, color: Colors.blueGrey),
                  ),
                  Text(
                    "₹ $prize",
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery: ",
                    style: GoogleFonts.urbanist(
                        fontSize: 18, color: Colors.blueGrey),
                  ),
                  Text(
                    "₹ $deliver",
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ",
                    style: GoogleFonts.urbanist(
                        fontSize: 18, color: Colors.blueGrey),
                  ),
                  Text(
                    "₹ $total",
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width * 0.9, 50),
                    backgroundColor: const Color.fromRGBO(252, 151, 142, 1)),
                onPressed: () {
                  String name = "", path = "";
                  var date = "";
                  final now = DateTime.now();
                  var updatedDate = now.add(const Duration(days: 3));
                  String formatter = DateFormat('yMd').format(updatedDate);

                  for (int i = 0; i < cartItems.length; i++) {
                    final item = cartItems[i];
                    name = item['name'];
                    path = item['path'];
                    date = formatter;
                    orderItems.insert(0, {
                      'path': path,
                      'name': name,
                      'date': date,
                    });
                  }
                  writeOrder(mailS, orderItems);
                  clearCart(mailS);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(milliseconds: 500),
                      content:
                          Text("Order Placed", style: GoogleFonts.urbanist())));
                  if (widget.page.compareTo("cart") == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Navigate(1),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
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
            ],
          ),
        ),
      )),
    );
  }
}
