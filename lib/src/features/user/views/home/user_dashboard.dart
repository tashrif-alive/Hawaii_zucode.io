import 'package:flutter/material.dart';
import 'package:hawaii_beta/src/features/user/views/home/user_flight_tabs.dart';
import 'package:hawaii_beta/src/features/user/views/home/user_hotels_tabs.dart';
import '../../../../widgets/tabs/user_tab_bar.dart';
import '../../../admin/services/bus/view/bus_list.dart';
import '../../../admin/services/hotel/view/hotel_info_form.dart';


class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int current = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: current);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Flight",
      "Hotel",
      "Bus",
      "Cab",
    ];

    List<String> images = [
      "assets/icons/logos/flight.png",
      "assets/icons/logos/hotels.png",
      "assets/icons/logos/buses.png",
      "assets/icons/logos/cabs.png",
    ];
    List<Widget> tabContent = [
      const UserFlightTab(),
      const UserHotelTab(),
      const BusListScreen(),
       const HotelInformationForm()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UserAppBar(
        onPressed: () {},
        image: 'assets/icons/logos/hawaii_logo.png',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(images.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                          pageController.animateToPage(
                            current,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 21),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.black87
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(12)
                                : BorderRadius.circular(12),
                            border: current == index
                                ? Border.all(
                                color: Colors.black, width: 2.5)
                                : null,
                          ),
                          child: Center(
                            child: Image.asset(
                              images[index],
                              width: current == index ? 100 : 105,
                              height: current == index ? 100 : 105,
                              color: current == index
                                  ? Colors.amber
                                  : Colors.grey.shade400,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        current = index;
                      });
                    },
                    children: tabContent,
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Text(
            //     'Why Book hawaii?',
            //     style: GoogleFonts.poppins(
            //       fontSize: 16,
            //       fontWeight: FontWeight.w700,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // const AliancesBannerCarousel(),

          ],
        ),
      ),
    );
  }
}
