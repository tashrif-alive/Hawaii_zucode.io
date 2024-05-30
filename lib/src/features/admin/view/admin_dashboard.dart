import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hawaii_beta/src/features/admin/services/bus/view/bus_list.dart';
import '../services/airline/view/airline_list_Widget.dart';
import '../services/airline/view/flight_list_screen.dart';
import '../services/hotel/view/hotel_list.dart';
import '../services/hotel/view/hotel_list_widget.dart';
import '../services/rent_a_car/view/car_list_screen.dart';
import '../widgets/user_list.dart';

class AdminDashboard extends StatefulWidget {
  static String routeName = 'AdminDashboard';

  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int userCount = 0;
  int flightCount = 0;
  int hotelCount = 0;
  int busCount = 0;
  int cabCount = 0;
  int driverCount = 0;

  @override
  void initState() {
    super.initState();
    fetchUserCount();
  }

  void fetchUserCount() {
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        userCount = snapshot.docs.length;
      });
    });

    FirebaseFirestore.instance
        .collection('flights')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        flightCount = snapshot.docs.length;
      });
    });

    FirebaseFirestore.instance
        .collection('hotels')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        hotelCount = snapshot.docs.length;
      });
    });
    FirebaseFirestore.instance
        .collection('buses')
        .snapshots()
        .listen((snapshot) {
      setState(() {
       busCount = snapshot.docs.length;
      });
    });
    FirebaseFirestore.instance
        .collection('cars')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        cabCount = snapshot.docs.length;
      });
    });FirebaseFirestore.instance
        .collection('drivers')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        driverCount = snapshot.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///User
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey.shade50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Users", // Display the user count
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$userCount", // Display the user count
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.to(const UserList());
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(50, 30),
                            // Set the desired width and height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Set the desired border radius
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'View all',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/user_dash.svg',
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ///Flight&Hotels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Expanded(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .435,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey.shade50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Flights", // Display the user count
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "$flightCount", // Display the user count
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.to(const FlightListScreenWidget());
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(50, 30),
                                    // Set the desired width and height
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Set the desired border radius
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Expanded(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .435,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey.shade50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Hotels",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "$hotelCount",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.to(const HotelListScreenWidget());
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(50, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ///Bus&Car_rental
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Expanded(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .435,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey.shade50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Bus", // Display the user count
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "$busCount", // Display the user count
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.to(const BusListScreen());
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(50, 30),
                                    // Set the desired width and height
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // Set the desired border radius
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Expanded(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .435,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey.shade50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Cabs",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "$cabCount",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.to(const CarListScreen());
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(50, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
