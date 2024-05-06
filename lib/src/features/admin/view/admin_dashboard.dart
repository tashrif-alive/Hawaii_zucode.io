import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login/view/signin_screen.dart';
import '../../user/components/ticket/view/plane_ticket.dart';
import '../services/airline/view/flight_list_screen.dart';
import '../services/bus/view/bus_list.dart';
import '../services/hotel/view/hotel_list.dart';
import '../services/rent_a_car/view/driver_list_screen.dart';
import '../widgets/user_list.dart';


class AdminDashboard extends StatefulWidget {
  static String routeName = 'AdminDashboard';

  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminTabBar(),
            const Text(
              'User Statistics',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                   Get.to(const UserList());
                  print("Card tapped!");
                },
                child: Card(
                  elevation: 1,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/users.svg',
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Column(
                        children: [
                          Text(
                            "15",
                            style: GoogleFonts.roboto(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Users",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),

                        ],

                      ),
                    ],

                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FlightListScreen()),
                );
              },
              child: const Text('View flight list'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HotelListScreen()),
                );
              },
              child: const Text('View hotel list'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusListScreen()),
                );
              },
              child: const Text('View buses list'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverListScreen()),
                );
              },
              child: const Text('View driver list'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const PlaneTicket(flightdata: flightdata,)),
            //     );
            //   },
            //   child: const Text('carousel'),
            // ),

          ],
        ),
      ),
    );
  }
}
///TabBar
class AdminTabBar extends StatelessWidget {
  const AdminTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/logos/hawaii_logo.png',
            height: 50,
            width: MediaQuery.of(context).size.width * 0.22,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
