import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<dynamic> notiItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBack(context, "Notifications"),
      body: notiItem.isNotEmpty
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notiItem.length,
              itemBuilder: (context, index) {
                return null;
              })
          : Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(child: Image.asset("assets/images/nothing.png")),
            ),
    );
  }
}
