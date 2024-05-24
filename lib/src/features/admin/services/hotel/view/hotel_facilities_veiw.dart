import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HotelFacilitiesScreen {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, Map<String, dynamic> hotelData) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Facilities',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///MostPopular
                            Text(
                              'Most Popular',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            HotelFacilitiesScreen().facilityGridView(
                                (hotelData['facilities'] as List<dynamic>?)
                                        ?.cast<String>() ??
                                    []),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      ///Access
                      Row(
                        children: [
                          const Icon(
                            Iconsax.card5,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Access',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['access'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///safetySecurity
                      Row(
                        children: [
                          const Icon(
                            Iconsax.security_safe,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Safety & security',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['safetySecurity'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///roomAmenities
                      Row(
                        children: [
                          const Icon(
                            Icons.home_max_rounded,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Room Amenities',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['roomAmenities'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///bathRoom
                      Row(
                        children: [
                          const Icon(
                            Icons.bathtub,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Bath Room',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['bathRoom'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///family
                      Row(
                        children: [
                          const Icon(
                            Icons.family_restroom,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Family & Kids',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['family'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///transport
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.car,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Transfer & Transport',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['transport'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///internetServices
                      Row(
                        children: [
                          const Icon(
                            Icons.wifi,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Internet Services',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['internetServices'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///sports
                      Row(
                        children: [
                          const Icon(
                            Icons.sports_football_rounded,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Activities & sports',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['sports'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///servicesAndConveniences
                      Row(
                        children: [
                          const Icon(
                            Icons.room_service,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Services & Conveniences',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['servicesAndConveniences']
                                      as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///Safety & Cleanliness
                      Row(
                        children: [
                          const Icon(
                            Icons.cleaning_services_outlined,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Safety & Cleanliness',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['meds'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                      const SizedBox(
                        height: 12,
                      ),

                      ///languages
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.language,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Languages',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      HotelFacilitiesScreen().accessListView(
                          (hotelData['languages'] as List<dynamic>?)
                                  ?.cast<String>() ??
                              []),
                    ],
                  ),
                ),
              ),
            ));
  }

  Icon getFacilityIcon(String facility) {
    switch (facility.toLowerCase()) {
      case '24*7 room service':
        return const Icon(Icons.room_service, size: 14);
      case 'wi-fi':
        return const Icon(Icons.wifi, size: 14);
      case '24*7 check-in':
        return const Icon(Icons.home_mini, size: 14);
      case 'ac rooms':
        return const Icon(Icons.ac_unit, size: 14);
      case 'daily housekeeping':
        return const Icon(Icons.cleaning_services, size: 14);
      case 'wheelchair accessible':
        return const Icon(Icons.wheelchair_pickup, size: 14);
      default:
        return const Icon(Icons.help_outline);
    }
  }

  Widget facilityGridView(List<String> facilities) {
    final displayedFacilities =
        facilities.length > 6 ? facilities.sublist(0, 6) : facilities;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        mainAxisExtent: 25,
      ),
      itemCount: displayedFacilities.length,
      itemBuilder: (context, index) {
        final facility = displayedFacilities[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getFacilityIcon(facility),
            const SizedBox(width: 8.0), // Use width here instead of height
            Text(
              facility,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        );
      },
    );
  }

  Widget accessListView(List<String> access) {
    final displayedAccess = access.length > 50 ? access.sublist(0, 50) : access;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedAccess.length,
      itemBuilder: (context, index) {
        final access = displayedAccess[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                access,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget safetySecurityListView(List<String> safetySecurity) {
    final displayedSafetySecurity = safetySecurity.length > 50
        ? safetySecurity.sublist(0, 50)
        : safetySecurity;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedSafetySecurity.length,
      itemBuilder: (context, index) {
        final safetySecurity = displayedSafetySecurity[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                safetySecurity,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget roomAmenitiesListView(List<String> roomAmenities) {
    final displayedRoomAmenities = roomAmenities.length > 50
        ? roomAmenities.sublist(0, 50)
        : roomAmenities;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedRoomAmenities.length,
      itemBuilder: (context, index) {
        final roomAmenities = displayedRoomAmenities[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                roomAmenities,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bathRoomListView(List<String> bathRoom) {
    final displayedBathRoom =
        bathRoom.length > 50 ? bathRoom.sublist(0, 50) : bathRoom;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedBathRoom.length,
      itemBuilder: (context, index) {
        final bathRoom = displayedBathRoom[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                bathRoom,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget familyListView(List<String> family) {
    final displayedFamily = family.length > 50 ? family.sublist(0, 50) : family;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedFamily.length,
      itemBuilder: (context, index) {
        final family = displayedFamily[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                family,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget transportListView(List<String> transport) {
    final displayedTransport =
        transport.length > 50 ? transport.sublist(0, 50) : transport;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedTransport.length,
      itemBuilder: (context, index) {
        final transport = displayedTransport[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                transport,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget internetServicesListView(List<String> internetServices) {
    final displayedInternetServices = internetServices.length > 50
        ? internetServices.sublist(0, 50)
        : internetServices;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedInternetServices.length,
      itemBuilder: (context, index) {
        final internetServices = displayedInternetServices[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                internetServices,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget sportsListView(List<String> sports) {
    final internetSports = sports.length > 50 ? sports.sublist(0, 50) : sports;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: internetSports.length,
      itemBuilder: (context, index) {
        final sports = internetSports[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                sports,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget servicesAndConveniencesListView(List<String> servicesAndConveniences) {
    final displayedServicesAndConveniences = servicesAndConveniences.length > 50
        ? servicesAndConveniences.sublist(0, 50)
        : servicesAndConveniences;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedServicesAndConveniences.length,
      itemBuilder: (context, index) {
        final servicesAndConveniences = displayedServicesAndConveniences[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                servicesAndConveniences,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget medsListView(List<String> meds) {
    final displayedMeds = meds.length > 50 ? meds.sublist(0, 50) : meds;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedMeds.length,
      itemBuilder: (context, index) {
        final meds = displayedMeds[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                meds,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget languagesListView(List<String> languages) {
    final displayedLanguages =
        languages.length > 50 ? languages.sublist(0, 50) : languages;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedLanguages.length,
      itemBuilder: (context, index) {
        final languages = displayedLanguages[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 20),
              child: Text(
                languages,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }
}
