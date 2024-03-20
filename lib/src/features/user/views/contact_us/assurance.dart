import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assurance extends StatefulWidget {
  @override
  _AssuranceState createState() => _AssuranceState();
}

class _AssuranceState extends State<Assurance> {
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.generate(faqData.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("airVenture assured",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfc8a28), Color(0xFFc55c00)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(5),
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _isExpandedList[index] = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(
                      faqData[index]['question']!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  );
                },
                body: ListTile(
                  title: Text(
                    faqData[index]['answer']!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
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
    'question': 'Features of flight airVenture assured',
    'answer':
        'airVenture assured fares now come with an added advantage: \n -free cancellation for all new domestic flight bookings. This is particularly advantageous for travelers who find themselves uncertain about their upcoming journeys and require the flexibility to adjust their plans due to unexpected circumstances.',
  },
  {
    'question': 'Benefits of airVenture assured',
    'answer':
        'ixigo assured offers free cancellation with full refund of flight fares on all new domestic flight bookings. Some key benefits include: \n - Full Refunds On Cancellation. \n - Premium Customer Support. \n - Instant Refund within minutes. \n - Free Vouchers'
  },
  {
    'question': 'Claiming a refund for airVenture assured booking',
    'answer':
        'If you have opted for Free Cancellation, you are eligible for a full refund if you cancel your booking within the following timelines: \n 1. Booking was made between 10 hours - 26 hours, cancel before 8 hours. \n 2. Booking was made between 26 hours - 91 days, cancel before 24 hours.'
  },
  {
    'question': 'Terms and Conditions of airVenture assured',
    'answer': 'Please visit the airVenture assured page for detailed information on the Terms and Conditions. To know more: \n Visit : https://www.airventure.com/airventure-assured \n Contact : tashrifalive@gmail.com'
  }
];
