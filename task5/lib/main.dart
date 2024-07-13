import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task5/caller.dart';
import 'package:task5/home.dart';
import 'package:task5/login.dart';
import 'package:task5/register.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('DBbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false),
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Register(),
        '/caller': (context) => Call()
      },
    );
  }
}
