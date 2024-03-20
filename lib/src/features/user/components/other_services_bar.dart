import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../widgets/bar/mid_bar_widgets.dart';
import '../../admin/services/hotel/view/add_hotel_form.dart';
import '../../admin/services/hotel/view/hotel_info_form.dart';

class ExtraServicesBar extends StatelessWidget {
  const ExtraServicesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(

        color: Colors.white70,
        padding: const EdgeInsets.all(2),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ExtraServicesBarWidget(
                iconData: Icons.flight,
                text: "Flight\nStatus",
                onTap: () => Get.to(() => const AddHotelForm()),
              ),
              ExtraServicesBarWidget(
                iconData: Icons.time_to_leave,
                text: "Airport\nCab",
                onTap: () => Get.to(() => const HotelInformationForm()),
              ),
              ExtraServicesBarWidget(
                iconData: FontAwesomeIcons.book,
                text: "Packages",
                onTap: () => Get.to(() => const AddHotelForm()),
              ),
              ExtraServicesBarWidget(
                iconData: Icons.bar_chart,
                text: "Fare\nAlerts",
                onTap: () {},
              ),
              ExtraServicesBarWidget(
                iconData: FontAwesomeIcons.accusoft,
                text: "Apply\nVisa",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
