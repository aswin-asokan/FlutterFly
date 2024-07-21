import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/login.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/variables.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('DBbox');

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true),
    darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
    ),
    themeMode: ThemeMode.system,
    home: LoginPage(),
  ));
}
