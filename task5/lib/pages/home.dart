import 'package:flutter/material.dart';
import 'package:task5/pages/items_data.dart';
import 'package:task5/widgets/homebottom.dart';
import 'package:task5/widgets/hometop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeTop(height, width),
              const Homebottom() // Display content based on the selected tab
            ],
          ),
        ),
      ),
    );
  }
}
