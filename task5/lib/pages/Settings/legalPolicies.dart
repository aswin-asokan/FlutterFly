import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/pages/Settings/legalPages.dart';
import 'package:task5/variables.dart';
import 'package:task5/widgets/widgets.dart';

class Legalpolicies extends StatefulWidget {
  const Legalpolicies({super.key});

  @override
  State<Legalpolicies> createState() => _LegalpoliciesState();
}

class _LegalpoliciesState extends State<Legalpolicies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBack(context, "Legal Policies"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Divider(
                color: Colors.grey,
              ),
              profileIcon(
                  "Terms of Service",
                  "Know our terms of service and use",
                  context,
                  Legalpages(
                      "Terms of Service",
                      Column(
                        children: [
                          legal(termsHead[0], termsBody[0]),
                          legal(termsHead[1], termsBody[1]),
                          legal(termsHead[2], termsBody[2]),
                          legal(termsHead[3], termsBody[3]),
                          legal(termsHead[4], termsBody[4]),
                          legal(termsHead[5], termsBody[5]),
                          legal(termsHead[6], termsBody[6]),
                          legal(termsHead[7], termsBody[7]),
                          legal(termsHead[8], termsBody[8]),
                        ],
                      ))),
              profileIcon(
                "Privacy Policy",
                "Know our Policies here",
                context,
                Legalpages(
                    "Privacy Policy",
                    Column(
                      children: [
                        legal(privacyHead[0], privacyBody[0]),
                        legal(privacyHead[1], privacyBody[1]),
                        legal(privacyHead[2], privacyBody[2]),
                        legal(privacyHead[3], privacyBody[3]),
                        legal(privacyHead[4], privacyBody[4]),
                        legal(privacyHead[5], privacyBody[5]),
                      ],
                    )),
              ),
              profileIcon(
                  "License Agreement",
                  "Read our license details",
                  context,
                  Legalpages(
                      "License Agreement",
                      Column(
                        children: [
                          legal(licenseHead[0], licenseBody[0]),
                          legal(licenseHead[1], licenseBody[1]),
                          legal(licenseHead[2], licenseBody[2]),
                          legal(licenseHead[3], licenseBody[3]),
                          legal(licenseHead[4], licenseBody[4]),
                          legal(licenseHead[5], licenseBody[5]),
                          legal(licenseHead[6], licenseBody[6]),
                        ],
                      ))),
              profileIcon(
                  "Return Policy",
                  "Read our return policy details",
                  context,
                  Legalpages(
                      "Return Policy",
                      Column(
                        children: [
                          legal("Cancellation Policy", cancellation),
                          legal("Return Policy", returnPolicy)
                        ],
                      ))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "© Pocket Dresses 2024",
                    style: GoogleFonts.urbanist(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
/*
profileIcon("Privacy Policy", "Know our Policies here", context,
                  Legalpages()),
              
              profileIcon("Return Policy", "Read our return policy details",
                  context, Legalpages()),*/