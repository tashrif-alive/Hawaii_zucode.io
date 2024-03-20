import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../features/user/views/contact_us/contact_us.dart';
import '../../features/user/views/home/user_dashboard.dart';
import '../../features/user/views/user_profile/user_profile screen.dart';
import '../../features/user/views/user_trip/user_trip_screen.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          elevation: 1,
          backgroundColor: Colors.grey.shade50,
          surfaceTintColor: Colors.red,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations:  [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home_active.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 30,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/trip.svg',
                height:30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/trip_active.svg',
                height: 30,
              ),
              label: "My Trip",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/text_regular.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/text.svg',
                height: 30,
              ),
              label: "Contact Us",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/user_regular.svg',
                height: 30,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30,
              ),
              label: "User",
            ),
          ],

        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

//..................Navigation_Controller....................

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const UserDashboard(),
     UserTripScreen(),
    const ContactUs(),
    const UserProfileScreen()

  ];
}
