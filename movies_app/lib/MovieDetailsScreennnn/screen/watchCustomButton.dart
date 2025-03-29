import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class watchCustomButton extends StatelessWidget {
  final String? url;

  const watchCustomButton({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url != null && url!.isNotEmpty) {
          _launchURL(url!);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE82626),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            "Watch",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}