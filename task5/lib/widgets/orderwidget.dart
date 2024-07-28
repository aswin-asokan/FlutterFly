import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orderwidget extends StatefulWidget {
  final String path, name;
  var date;
  Orderwidget(this.path, this.name, this.date, {super.key});

  @override
  State<Orderwidget> createState() => _OrderwidgetState();
}

class _OrderwidgetState extends State<Orderwidget> {
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
          height: h * 0.17,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.17,
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
                        "Delivery On",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: w * 0.5,
                      child: Text(
                        widget.date,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(fontSize: 16),
                      ),
                    ),
                    Container(
                        width: w * 0.5,
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(fontSize: 16),
                        )),
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
