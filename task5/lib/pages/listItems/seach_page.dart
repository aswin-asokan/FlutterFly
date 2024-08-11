import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/pages/navigate.dart';
import 'package:task5/widgets/itemcard.dart';
import 'package:task5/pages/listItems/items_data.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults = _searchItems(widget.query);
  }

  List<Item> _searchItems(String query) {
    List<Item> allItems = [
      ...menItems,
      ...womenItems,
      ...kidItems
    ]; // Combine all items
    return allItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 35,
            )),
        title: Text('Search Results', style: GoogleFonts.urbanist()),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .7,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 6.0,
        children: _searchResults
            .map((item) => ItemCard(
                item.imagePath,
                item.shop,
                item.description,
                item.category,
                item.title,
                item.price,
                width,
                item.imageList,
                context))
            .toList(),
      ),
    );
  }
}
