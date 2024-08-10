import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Savedaddress extends StatefulWidget {
  const Savedaddress({super.key});

  @override
  State<Savedaddress> createState() => _SavedaddressState();
}

class _SavedaddressState extends State<Savedaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBack(context, "Addresses"),
    );
  }
}
