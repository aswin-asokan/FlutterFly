import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/pages/profile/login.dart';
import 'package:task5/pages/home.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('DBbox');
  var cart = await Hive.openBox('Cart');
  var orders = await Hive.openBox('Orders');
  runApp(MaterialApp(
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
    home: const LoginPage(),
  ));
}
