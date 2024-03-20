import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreBookQusPack extends StatefulWidget {
  const PreBookQusPack({Key? key}) : super(key: key);

  @override
  _PreBookQusPackState createState() => _PreBookQusPackState();
}

class _PreBookQusPackState extends State<PreBookQusPack> {
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
    'question': 'How to book a holiday package on airVenture?',
    'answer': 'Visit the holiday packages icon on the app or website or use the link : \n https://airventure.pickyourpack.com \n  \n Steps to book a Holiday Package : \n -Log in using your airVenture account if you are not already logged in. \n -Select the destination, no of nights, no of guests, preferred travel date and start city to view the different package deals. \n -Select the package that you want. You can also customise the package as per your need. \n -Provide your details and make payment to confirm the booking.'
  },
  {
    'question': 'Issues faced while booking holiday packages',
    'answer': 'In case you face any issues while booking holiday packages, please reach out over Call/Chat support options from the ixigo app itself. You can also reach out for support at tashrialive@gmail.com'
  },
  {
    'question': 'Issues faced after booking holiday packages',
    'answer': 'In case of any escalations, reach out to the following email id - escalations@pickyourtrail. For any on-ground SoS and emergencies, you can also reach us for support at the following contact number +8801999917081'
  },
];
