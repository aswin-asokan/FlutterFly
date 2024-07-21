import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/widgets/kids.dart';
import 'package:task5/widgets/men.dart';
import 'package:task5/widgets/women.dart';

class Homebottom extends StatefulWidget {
  const Homebottom({super.key});

  @override
  State<Homebottom> createState() => _HomebottomState();
}

class _HomebottomState extends State<Homebottom> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onButtonPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 50),
      curve: Curves.linear,
    );
  }

  Widget _getPageContent() {
    switch (_currentIndex) {
      case 0:
        return Men(MediaQuery.of(context).size.width, context);
      case 1:
        return Women(MediaQuery.of(context).size.width, context);
      case 2:
        return kids(MediaQuery.of(context).size.width,
            context); // Placeholder for Kids section
      default:
        return Men(MediaQuery.of(context).size.width, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        OverflowBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              child: Text('Men', style: GoogleFonts.urbanist(fontSize: 16)),
              onPressed: () => _onButtonPressed(0),
            ),
            TextButton(
              child: Text(
                'Women',
                style: GoogleFonts.urbanist(fontSize: 16),
              ),
              onPressed: () => _onButtonPressed(1),
            ),
            TextButton(
              child: Text('Kids', style: GoogleFonts.urbanist(fontSize: 16)),
              onPressed: () => _onButtonPressed(2),
            ),
          ],
        ),
        SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _getPageContent(),
        ),
      ],
    );
  }
}
