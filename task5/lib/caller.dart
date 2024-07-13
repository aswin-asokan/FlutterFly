import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final url = Uri(scheme: 'tel', path: '+6238303567');
                    launchUrl(url);
                  },
                  child: Text("Call")),
              ElevatedButton(
                  onPressed: () async {
                    final website = Uri.parse("https://www.google.com");
                    launchUrl(website, mode: LaunchMode.externalApplication);
                  },
                  child: Text("Website")),
            ],
          ),
        ),
      ),
    );
  }
}
