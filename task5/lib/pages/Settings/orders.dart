import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task5/variables.dart';
import 'package:task5/widgets/orderwidget.dart';
import 'package:task5/widgets/widgets.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final orderBox = Hive.box('Orders');
  @override
  Widget build(BuildContext context) {
    List<dynamic> orderItems = orderBox.get(mailS, defaultValue: []);
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: customBack(context, "My Orders"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                orderItems.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: orderItems.length,
                        itemBuilder: (context, index) {
                          final item = orderItems[index];
                          return Orderwidget(
                            item['path'] ?? '',
                            item['name'] ?? '',
                            item['date'] ?? '',
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
