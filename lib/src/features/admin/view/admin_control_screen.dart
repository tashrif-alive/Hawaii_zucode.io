import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controls/upload_banners/upload_destination_banner_form.dart';
import '../services/bus/view/add_buses_screen.dart';
import '../services/rent_a_car/view/add_car_screen.dart';
import '../services/rent_a_car/view/add_driver_details screens.dart';
import 'airline_services.dart';
import 'aliances_banner_screen.dart';
import 'destination_banner_screen.dart';
import 'hotel_services.dart';

class AdminControlsScreen extends StatefulWidget {
  const AdminControlsScreen({Key? key});

  @override
  State<AdminControlsScreen> createState() => _AdminControlsScreenState();
}

class _AdminControlsScreenState extends State<AdminControlsScreen> {
  final List<Map<String, dynamic>> services = [
    {
      "icon": Icons.post_add_rounded,
      "color": Colors.indigo,
      "title": "Upload Banners",
      "screen": const DestinationBannerScreen(),
      "cardColor": Colors.indigo.shade50,
    },
    {
      "icon": Icons.local_offer_rounded,
      "color": Colors.brown,
      "title": "Alliance Banners",
      "screen":  const AliancesBannerScreen(),
      "cardColor": Colors.brown.shade50,
    },
    {
      "icon": Icons.history,
      "color": Colors.cyan,
      "title": "News & Travel Stories",
      "cardColor": Colors.cyan.shade50,
      "screen": AddBusView()
    },
    {
      "icon": Icons.question_answer_rounded,
      "color": Colors.orange,
      "cardColor": Colors.orange.shade50,
      "title": "Help Chats",
      "screen":  AddDriverView()
    },
    {
      "icon": Icons.payment,
      "color": Colors.blueGrey,
      "cardColor": Colors.blueGrey.shade50,
      "title": "Payments Controls",
      "screen": AddCarScreen()
    },
    {
      "icon": Icons.question_mark,
      "color": Colors.green,
      "cardColor": Colors.green.shade50,
      "title": "FAQs",
      "screen": const AirLineServices()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Controls",
                style: GoogleFonts.ubuntu(
                    fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 12,
              ),
              // ListView to display services
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: services[index]['cardColor'],
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(

                      leading: Icon(
                        services[index]['icon'],
                        color: services[index]['color'],
                      ),
                      title: Text(
                        services[index]['title'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        Get.to(services[index]['screen']);
                      },
                    ),
                  );
                },
              ),
              // const SizedBox(height: 12),
              // const Divider(thickness: 1),
              // const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
