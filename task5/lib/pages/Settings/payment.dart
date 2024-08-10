import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBack(context, "Payment Methods"),
    );
  }
}
