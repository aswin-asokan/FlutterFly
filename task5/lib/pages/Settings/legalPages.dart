import 'package:flutter/material.dart';
import 'package:task5/widgets/widgets.dart';

class Legalpages extends StatefulWidget {
  String title;
  Widget widgetBody;
  Legalpages(this.title, this.widgetBody, {super.key});

  @override
  State<Legalpages> createState() => _LegalpagesState();
}

class _LegalpagesState extends State<Legalpages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBack(context, widget.title),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), child: widget.widgetBody),
      )),
    );
  }
}
