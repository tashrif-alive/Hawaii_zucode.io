import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/admin/services/airline/view/add_flight_form.dart';
import '../../features/admin/services/bus/view/add_buses_screen.dart';
import '../../features/admin/services/hotel/view/add_hotel_form.dart';
import '../../features/admin/services/rent_a_car/view/add_car_screen.dart';
import '../../features/admin/view/admin_control_screen.dart';
import '../../features/admin/view/admin_dashboard.dart';
import '../../features/admin/view/admin_more_screen.dart';
import '../../features/admin/view/admin_services.dart';
import '../../features/login/view/signin_screen.dart';

class AdminBottomBar extends StatefulWidget {
  static String routeName = 'AdminBottomBar';

  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminBottomBarController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // Handle logo click action
              },
              child: SvgPicture.asset("assets/icons/Logo_svg.svg", width: 90),
            ),
            Row(
              children: [
                PopupMenuButton(
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(FontAwesomeIcons.plane,
                              color: Colors.black),
                          title: Text(
                            'Flight',
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Get.to(() => const FlightFormView());
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.business_rounded,
                            color: Colors.black,
                          ),
                          title: Text('Hotel',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500)),
                          onTap: () {
                            Navigator.pop(context);
                            Get.to(() => const AddHotelForm());
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.directions_bus_sharp,
                            color: Colors.black,
                          ),
                          title: Text('Bus',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500)),
                          onTap: () {
                            Navigator.pop(context);
                            Get.to(() => AddBusView());
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.time_to_leave,
                            color: Colors.black,
                          ),
                          title: Text('Car',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500)),
                          onTap: () {
                            Navigator.pop(context);
                            Get.to(() => AddCarScreen());
                          },
                        ),
                      ),
                    ];
                  },
                  // Add shape property
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set the border radius here
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print("Add icon tapped");
                    },
                    splashRadius: 5,
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    splashRadius: 5,
                    icon: const Icon(
                      Icons.person_2,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 1,
          backgroundColor: Colors.grey.shade50,
          surfaceTintColor: Colors.red,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/dashboard.svg',
                height: 35, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/dashboard_active.svg',
                height: 35, // Replace with the desired height
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/services.svg',
                height: 35, // Replace with the desired height
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/services_active.svg',
                height: 35, // Replace with the desired height
              ),
              label: 'Services',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/controls.svg',
                height: 35,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/controls.svg',
                height: 35,
              ),
              label: 'Controls',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/more.svg',
                height: 35,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/more_active.svg',
                height: 35,
              ),
              label: 'More',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

///..................AdminBottomBarController....................///
class AdminBottomBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const AdminDashboard(),
    const AdminServicesScreen(),
    const AdminControlsScreen(),
    const AdminMoreScreen()
  ];
}
