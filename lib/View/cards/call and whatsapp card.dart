import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CallAndWhatsappCard extends StatelessWidget {
  final String label;
  final String imagePath;
  bool isWhatsapp;

  CallAndWhatsappCard({
    required this.isWhatsapp,
    required this.label,
    required this.imagePath,
    super.key,
  });
  Future<void> _sendWhatsAppMessage() async {
    final Uri url = Uri.parse(
        'whatsapp://send?phone=+201023732207');
    try {
      bool canLaunch = await canLaunchUrl(url);
      if (canLaunch) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print("WhatsApp is not installed or cannot be opened.");
      }
    } catch (e) {
      print("Error launching WhatsApp: $e");
    }
  }
  void _launchPhoneNumber() async {
    const phoneNumber = "tel:01023732207";
    if (await canLaunchUrlString(phoneNumber)) {
      await launchUrlString(phoneNumber);
    } else {
      print('Could not launch $phoneNumber');
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        isWhatsapp? _sendWhatsAppMessage():_launchPhoneNumber();
      },
      child: Container(
        height: 80,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blue[50]!,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              color: Colors.blue[50],
              height: 30,
              width: 30,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style:  TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.blue[50],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
