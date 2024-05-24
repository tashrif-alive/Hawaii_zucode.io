import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controls/upload_aliances/upload_aliances_screen.dart';
import '../controls/upload_banners/destination_banner_list.dart';
import '../controls/upload_banners/manage_banners.dart';
import '../controls/upload_banners/upload_destination_banner_form.dart';


class DestinationBannerScreen extends StatefulWidget {
  const DestinationBannerScreen({Key? key});

  @override
  State<DestinationBannerScreen> createState() => _DestinationBannerScreenState();
}

class _DestinationBannerScreenState extends State<DestinationBannerScreen> {
  final List<Map<String, dynamic>> DestinationBannerScreen = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Banners",
      "screen": AddDestinationBannerForm()
    },
    {
      "image": "assets/icons/logos/manage_flight.png",
      "color": Colors.cyan,
      "title": "Manage Banners",
      "screen": const ManageDestinationBannerList()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Banners",
          style: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Banners",
                style: GoogleFonts.ubuntu(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),
              ///DestinationBannerScreen
              ListView.builder(
                shrinkWrap: true,
                itemCount: DestinationBannerScreen.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DestinationBannerScreen[index]['screen']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: DestinationBannerScreen[index]['color'][50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              DestinationBannerScreen[index]['image'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              DestinationBannerScreen[index]['title'],
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500,
                                color: DestinationBannerScreen[index]['color'],
                                fontSize: 11, // Adjust text size here
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              const SizedBox(height: 12),
              Text(
                  "All Banners",
                  style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const DestinationBannerList(),
            ],
          ),
        ),
      ),
    );
  }
}
