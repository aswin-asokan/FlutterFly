import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/variables.dart';

class Cartwidget extends StatefulWidget {
  final String path, name, size;
  double prize;
  Cartwidget(this.path, this.name, this.size, this.prize, {super.key});
  @override
  State<Cartwidget> createState() => _CartwidgetState();
}

int count = 1;

class _CartwidgetState extends State<Cartwidget> {
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
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(26, 88, 85, 85),
                blurRadius: 2,
                spreadRadius: 3,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.red[50],
          ),
          height: h * 0.18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.18,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
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
                    Container(
                      width: w * 0.5,
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: w * 0.5,
                      child: Text(
                        "Size: " + widget.size,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(fontSize: 16),
                      ),
                    ),
                    Container(
                        width: w * 0.5,
                        child: Text(
                          "Prize: \$ " + p.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(fontSize: 16),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: w * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.white,
                                    ),
                                    height: 35,
                                    width: 35,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              count--;
                                              p = widget.prize * count;
                                              totPrize -= widget.prize;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20,
                                          )),
                                    )),
                                Text(count.toString()),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.white,
                                    ),
                                    height: 35,
                                    width: 35,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              count++;
                                              p = widget.prize * count;
                                              totPrize += widget.prize;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 20,
                                          )),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
