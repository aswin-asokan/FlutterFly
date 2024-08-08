import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:task5/pages/seach_page.dart';
import 'package:task5/widgets/iamgeslide.dart';

class HomeTop extends StatefulWidget {
  final double height;
  final double width;

  const HomeTop(this.height, this.width, {super.key});

  @override
  _HomeTopState createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: ImageSlideshow(
            width: double.infinity,
            height: widget.height * 0.5,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {},
            autoPlayInterval: 7000,
            isLoop: true,
            children: [
              imageSlide("assets/images/downloadfile-5.jpg",
                  "Empower Your Elegance,", "Define Your Style.", Colors.white),
              imageSlide(
                  "assets/images/downloadfile-6.jpg",
                  "Redefine Your Style",
                  "Elevate Your Presence.",
                  Colors.white),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_isSearching)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              if (_searchController.text.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(
                                        query: _searchController.text),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  icon: Icon(_isSearching ? Icons.close : Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      if (!_isSearching) {
                        _searchController.clear();
                      }
                    });
                  },
                ),
                Badge(
                  isLabelVisible: false,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_sharp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
