import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxListWidget extends StatelessWidget {
  final String title;
      final List<String> options;
  final List<String> selectedList;
  final Function(bool, String) onSelected;
  const CheckBoxListWidget({super.key, required this.title, required this.options, required this.selectedList, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 6,
          runSpacing: 1,
          children: options
              .map((option) => FilterChip(
            label: Text(
              option,
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
            selected: selectedList.contains(option),
            onSelected: (bool selected) => onSelected(selected, option),
          ))
              .toList(),
        ),
      ],
    );
  }
}

class AppCities{
  static final routes = [
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Khulna',
    'Barisal',
    'Sylhet',
    'Rangpur',
    'Mymensingh',
    'Comilla',
    'Noakhali',
    'Jessore',
    'Feni',
    'Bogura',
    'Narayanganj',
    'Dinajpur',
    'Tangail',
    'Jamalpur',
    'Pabna',
    'Gazipur',
    'Kushtia',
    'Faridpur',
    'Brahmanbaria',
    'Cumilla',
    'Coxs Bazaar',
    'Pirojpur',
    'Patuakhali',
    'Bhola',
    'Joypurhat',
    'Naogaon',
    'Magura',
    'Chuadanga',
    'Satkhira',
    'Jhenaidah',
    'Narsingdi',
    'Chandpur',
    'Manikganj',
    'Sunamganj',
    'Habiganj',
    'Moulvibazar',
    'Kurigram',
    'Lalmonirhat',
    'Nilphamari',
    'Thakurgaon',
    'Gaibandha',
    'Meherpur',
    'Narail',
    'Gopalganj',
    'Shariatpur',
    'Madaripur',
    'Rajbari',
    'Munshiganj',
    'Sherpur',
    'Netrakona',
    'Sunamganj',
    'Habiganj',
    'Moulvibazar',
    'Kurigram',
    'Lalmonirhat',
    'Nilphamari',
    'Thakurgaon',
    'Gaibandha',
    'Meherpur',
    'Narail',
    'Gopalganj'
  ];
}
