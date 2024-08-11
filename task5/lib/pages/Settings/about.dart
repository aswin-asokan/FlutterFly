import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task5/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final Uri urlGithub =
        Uri.parse('https://github.com/aswin-asokan/FlutterFly/');
    final Uri urlPortfolio =
        Uri.parse('https://personal-portfolio--ruby.vercel.app/');
    return Scaffold(
      appBar: customBack(context, "About Us"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_nobg.png", height: 150),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                textAlign: TextAlign.center,
                "Pocket Dresses is a charming shopping app with a minimalistic and modern design, Pocket Dresses offers a curated selection of cute dresses for every occasion. Enjoy a seamless shopping experience as you explore our stylish collection.",
                style: GoogleFonts.urbanist(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      child: Image.asset(
                        "assets/github.png",
                        height: 50,
                      ),
                      onTap: () {
                        launchUrl(urlGithub);
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      child: Image.asset(
                        "assets/dev.png",
                        height: 40,
                      ),
                      onTap: () {
                        launchUrl(urlPortfolio);
                      }),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
