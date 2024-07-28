import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:task5/pages/seach_page.dart';
import 'package:task5/widgets/iamgeslide.dart';

class HomeTop extends StatefulWidget {
  final double height;
  final double width;

  HomeTop(this.height, this.width, {Key? key}) : super(key: key);

  @override
  _HomeTopState createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

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
            children: [
              imageSlide("assets/images/downloadfile-5.jpg",
                  "Empower Your Elegance,", "Define Your Style.", Colors.white),
              imageSlide(
                  "assets/images/downloadfile-6.jpg",
                  "Redefine Your Style",
                  "Elevate Your Presence.",
                  Colors.white),
            ],
            onPageChanged: (value) {},
            autoPlayInterval: 7000,
            isLoop: true,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_isSearching)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            if (_searchController.text.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SearchPage(query: _searchController.text),
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
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_sharp),
                ),
                isLabelVisible: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
