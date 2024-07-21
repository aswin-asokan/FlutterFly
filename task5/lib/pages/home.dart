import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/widgets/homebottom.dart';
import 'package:task5/widgets/hometop.dart';
import 'package:task5/widgets/iamgeslide.dart';
import 'package:task5/widgets/itemcard.dart';
import 'package:task5/widgets/men.dart';
import 'package:task5/widgets/women.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _DBbox = Hive.box('DBbox');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 234, 235, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              homeTop(height, width),
              Homebottom() // Display content based on the selected tab
            ],
          ),
        ),
      ),
    );
  }
}
