import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreBookQus extends StatefulWidget {
  const PreBookQus({super.key});

  @override
  _PreBookQusState createState() => _PreBookQusState();
}

class _PreBookQusState extends State<PreBookQus> {
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.generate(faqData.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(0),
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _isExpandedList[index] = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(faqData[index]['question']!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black87,
                        )),
                  );
                },
                body: ListTile(
                  title: Text(faqData[index]['answer']!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black87,
                      )),
                ),
                isExpanded: _isExpandedList[index],
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Map<String, String>> faqData = [
  {
    'question': 'Maximum number of seats that can be booked under a single flight booking.',
    'answer': 'A maximum of 1 seats can be booked at one time'
  },
  {
    'question': 'Updating Passenger details in case traveller only has a first name',
    'answer': 'For domestic airlines, please enter your first name in both first and last name fields and proceed with the booking. \n For international travel, please check with your respective airline before booking the ticket.'
  },
  {
    'question': 'Online booking for a child traveling alone',
    'answer': 'No, you cannot make a booking for a child traveling alone. There has to be at least 1 adult in the booking'
  },
  {
    'question': 'Timeline for Booking confirmation',
    'answer': 'You will receive a confirmation within a few minutes on the email ID you provided at the time of booking. If you have not received a confirmation, please go to the My Trips section on the ixigo app or website and use the available customer service options.'
  },
  {
    'question': 'Guidelines for International flight bookings',
    'answer': 'Your name must be exactly the same as that on your passport.\n Please check visa requirements as per your travel itinerary. ixigo or the service provider is not liable for issues related to visa and incorrect passport info.'
  },
  {
    'question': 'Booking tickets for another person through my account',
    'answer': 'Just enter the details of the traveler you want to book for when you are asked to enter traveler details at the time of booking.'
  },
  {
    'question': 'Selection of seats for Flight bookings',
    'answer': 'You can select your own seat. In most cases, you can do so at the time of web check-in. Some airline carriers may charge an additional fee for seat selection. Please contact the airline you are booked with for details on seat selection for your trip.'
  },
  {
    'question': 'Boarding pass for Flight ticket',
    'answer': 'You need to show your ticket confirmation email at the check-in counter at the airport or do a web check-in on the airline website. An airline representative will issue your boarding pass or you could take a print-out if you are doing a web check-in.'
  },
  {
    'question': 'ID proof requirement at the time of check-in',
    'answer': 'It is mandatory to carry a Govt. photo ID proof such as an NID/Driving license/Passport, etc., for domestic travel. \n Additionally, a passport is mandatory for international travel.'
  },
  {
    'question': 'Carrying along pet on the flight',
    'answer': 'Most airlines do allow you to travel with pets. However, each airline has different policies regarding it in terms of rules, regulations and cost. Please visit the website or directly call the airline you are travelling with.'
  },
  {
    'question': 'Free Cancellation policy',
    'answer': 'Free Cancellation allows you to claim a refund of cancellation charges levied by airlines making it a zero-charge cancellation.'
  },
  {
    'question': 'Eligibility of Free cancellation benefits to flight modifications',
    'answer': 'Currently, Free Cancellation does not apply to flight modifications, you can, however, cancel the ticket and avail the benefits of Free Cancellation and book again.'
  },

];
