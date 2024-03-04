import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  final String url;

  const ContactButton({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Added horizontal padding
          child: Text(
            'If you can not find the videos, ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20), // Added bottom padding
          child: ElevatedButton(
            onPressed: () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              // Adjust the gradient accordingly
              // Replace primary with backgroundColor if needed
              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
              // Adjust overlayColor according to your preference
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Added padding around the text
              child: Text('Contact Us'),
            ),
          ),
        ),
      ],
    );
  }
}
