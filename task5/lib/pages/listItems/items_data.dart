import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task5/widgets/widgets.dart';

// Example Item class
class Item {
  String imagePath;
  String title;
  String shop;
  String description;
  String category;
  double price;
  List<Widget> imageList;

  Item(this.imagePath, this.title, this.shop, this.description, this.category,
      this.price, this.imageList);
}

List<Item> menItems = [];
Future<void> loadCSVMen() async {
  final String csvRaw = await rootBundle.loadString('assets/mendata.csv');

  // Parse the CSV string with the default delimiter (',') or specify if different
  List<List<dynamic>> csvData =
      const CsvToListConverter(eol: '\n').convert(csvRaw);

  // Clear existing items to avoid duplicates if loading multiple times
  menItems.clear();

  for (List<dynamic> row in csvData) {
    if (row.isEmpty) continue; // Skip empty rows

    // Store each column value into respective variables
    String list1 = row[0].toString();
    String list2 = row[1].toString();
    String list3 = row[2].toString();
    String list4 = row[3].toString();
    String list5 = row[4].toString();
    double list6 = double.tryParse(row[5].toString()) ?? 0.0;

    // Handle image URLs (assuming the image list is in the 7th column)
    String list7 = row[6].toString();
    RegExp urlPattern = RegExp(r'\"(https://[^\"]+)\"');
    Iterable<RegExpMatch> matches = urlPattern.allMatches(list7);
    List<Widget> list8 = matches.map((match) {
      String url = match.group(1)!; // Get the matched URL
      return imageList(url);
    }).toList();

    // Create an Item and add it to the menItems list
    menItems.add(Item(list1, list2, list3, list4, list5, list6, list8));
  }
}

List<Item> womenItems = [];
Future<void> loadCSVWomen() async {
  final String csvRaw = await rootBundle.loadString('assets/womendata.csv');
  List<List<dynamic>> csvData =
      const CsvToListConverter(eol: '\n').convert(csvRaw);
  // Clear existing items to avoid duplicates if loading multiple times
  menItems.clear();
  for (List<dynamic> row in csvData) {
    if (row.isEmpty) continue; // Skip empty rows
    // Store each column value into respective variables
    String list1 = row[0].toString();
    String list2 = row[1].toString();
    String list3 = row[2].toString();
    String list4 = row[3].toString();
    String list5 = row[4].toString();
    double list6 = double.tryParse(row[5].toString()) ?? 0.0;

    // Handle image URLs (assuming the image list is in the 7th column)
    String list7 = row[6].toString();
    RegExp urlPattern = RegExp(r'\"(https://[^\"]+)\"');
    Iterable<RegExpMatch> matches = urlPattern.allMatches(list7);
    List<Widget> list8 = matches.map((match) {
      String url = match.group(1)!; // Get the matched URL
      return imageList(url);
    }).toList();
    // Create an Item and add it to the menItems list
    womenItems.add(Item(list1, list2, list3, list4, list5, list6, list8));
  }
}

List<Item> kidItems = [];
Future<void> loadCSVkid() async {
  final String csvRaw = await rootBundle.loadString('assets/kids.csv');
  List<List<dynamic>> csvData =
      const CsvToListConverter(eol: '\n').convert(csvRaw);
  // Clear existing items to avoid duplicates if loading multiple times
  menItems.clear();
  for (List<dynamic> row in csvData) {
    if (row.isEmpty) continue; // Skip empty rows
    // Store each column value into respective variables
    String list1 = row[0].toString();
    String list2 = row[1].toString();
    String list3 = row[2].toString();
    String list4 = row[3].toString();
    String list5 = row[4].toString();
    double list6 = double.tryParse(row[5].toString()) ?? 0.0;

    // Handle image URLs (assuming the image list is in the 7th column)
    String list7 = row[6].toString();
    RegExp urlPattern = RegExp(r'\"(https://[^\"]+)\"');
    Iterable<RegExpMatch> matches = urlPattern.allMatches(list7);
    List<Widget> list8 = matches.map((match) {
      String url = match.group(1)!; // Get the matched URL
      return imageList(url);
    }).toList();
    // Create an Item and add it to the menItems list
    kidItems.add(Item(list1, list2, list3, list4, list5, list6, list8));
  }
}
