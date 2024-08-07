import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/variables.dart';

class Favwidget extends StatefulWidget {
  final String path, name, size;
  double prize;
  Favwidget(this.path, this.name, this.size, this.prize, {super.key});

  @override
  State<Favwidget> createState() => _FavwidgetState();
}

int count = 1;

class _FavwidgetState extends State<Favwidget> {
  late double p;
  @override
  void initState() {
    super.initState();
    p = widget.prize; // Initialize p with widget.prize
    totPrize += p;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(26, 88, 85, 85),
                blurRadius: 2,
                spreadRadius: 3,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.red[50],
          ),
          height: h * 0.17,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.17,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    widget.path,
                    width: w * 0.3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w * 0.5,
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.5,
                      child: Text(
                        "Size: ${widget.size}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                        width: w * 0.5,
                        child: Text(
                          "Prize: \$ $p",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(fontSize: 16),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Remove From Favorites",
                          style: GoogleFonts.urbanist(fontSize: 15),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
