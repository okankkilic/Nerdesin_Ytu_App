import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCard extends StatelessWidget {
  String title;

  UrlCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          onTap: () async {
            final url = Uri.parse('google.com');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          title: RichText(
            text: TextSpan(
              text: title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
