import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final String name, path, category, shop, about;
  final double prize;
  const Items(
      this.name, this.shop, this.about, this.path, this.category, this.prize,
      {super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: height * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        widget.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.storefront_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.shop),
                          ],
                        ),
                        Text(
                          widget.name,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "About Item",
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                        new Divider(
                          color: Colors.pinkAccent,
                        ),
                        Text(widget.about),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
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
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "₹ " + widget.prize.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  color: Color.fromRGBO(252, 151, 142, 1),
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.shopping_bag)),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(50, 50),
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {},
                        label: const Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
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
