import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controls/upload_aliances/banner_list.dart';

import '../controls/upload_aliances/upload_aliances_screen.dart';


class AliancesBannerScreen extends StatefulWidget {
  const AliancesBannerScreen({Key? key});

  @override
  State<AliancesBannerScreen> createState() => _AliancesBannerScreenState();
}

class _AliancesBannerScreenState extends State<AliancesBannerScreen> {
  final List<Map<String, dynamic>> aliancesBannerScreen = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Banners",
      "screen": const AliancesBannerFormView()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Airline ",
          style: GoogleFonts.ubuntu(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Banner",
                style: GoogleFonts.ubuntu(
                    fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),

              ///AliancesBannerScreen
              ListView.builder(
                shrinkWrap: true,
                itemCount: aliancesBannerScreen.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(aliancesBannerScreen[index]['screen']);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: aliancesBannerScreen[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            aliancesBannerScreen[index]['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            aliancesBannerScreen[index]['title'],
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w500,
                              color: aliancesBannerScreen[index]['color'],
                              fontSize: 11, // Adjust text size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              Text(
                  "All Banners",
                  style: GoogleFonts.ubuntu(fontSize: 17, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const AliancesBannerList(),
            ],
          ),
        ),
      ),
    );
  }
}
