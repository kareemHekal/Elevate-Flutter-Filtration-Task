import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cards/call and whatsapp card.dart';
import 'Show Items Page.dart';

class MyInformationPage extends StatelessWidget {
  const MyInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300,
        backgroundColor: Colors.blue[400],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/profile-pic.png",
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Kareem Abd Elaziz Hekal",
              style: GoogleFonts.reggaeOne(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              )
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "kareemhekal19@gmail.com",
              style: GoogleFonts.reggaeOne(
                  color: Colors.blue[50],
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Divider(
              thickness: 2,
              color: Colors.blue[50],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          /// first part which is the call and whatsapp
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            height: 90,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/texture.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CallAndWhatsappCard(
                      isWhatsapp: false,
                      label: "Call",
                      imagePath: "assets/images/phone.png",
                    ),
                    CallAndWhatsappCard(
                      isWhatsapp: true,
                      label: 'WhatsApp',
                      imagePath: 'assets/images/whatsapp.png',
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// first part which is the button
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/texture.jpg"),
                  fit: BoxFit
                      .cover, // This makes the image cover the entire body
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowItemsPage(),));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue[50],
                    backgroundColor: Colors.blue.withOpacity(0.8), // Slightly transparent background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.black.withOpacity(0.5), // Add shadow with opacity for depth
                    elevation: 12, // Increase the elevation for a stronger 3D effect
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Add padding for better spacing
                  ),
                  child:  Text(
                    "See My Task !",
                    style: GoogleFonts.reggaeOne(
                      fontWeight: FontWeight.bold, // Make the text stand out more
                      fontSize: 16,
                    ),
                  ),
                )

              ),
            ),
          ),
        ],
      ),
    );
  }
}
