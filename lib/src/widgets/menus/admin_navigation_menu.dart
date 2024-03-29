import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../features/admin/view/admin_control_screen.dart';
import '../../features/admin/view/admin_dashboard.dart';
import '../../features/admin/view/admin_more_screen.dart';
import '../../features/admin/view/admin_services.dart';

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
