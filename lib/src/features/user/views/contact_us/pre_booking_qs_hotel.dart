import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreBookQusHotel extends StatefulWidget {
  const PreBookQusHotel({Key? key}) : super(key: key);

  @override
  _PreBookQusHotelState createState() => _PreBookQusHotelState();
}

class _PreBookQusHotelState extends State<PreBookQusHotel> {
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
    'question': 'Confirmation Email post Booking completion',
    'answer': 'You will receive a confirmation email once you have completed your hotel booking via airVenture.'
  },
  {
    'question': 'Flexible check-in/check-out option at the hotel',
    'answer': 'While this isn’t covered under the booking, it’s best to call the hotel and check. Check-in and check-out policies vary from hotel to hotel.'
  },
  {
    'question': 'Unmarried couples check-in policy',
    'answer': 'It depends on the hotel policy. It is best to call the hotel and check with them or refer to the Terms and Conditions at the time of booking'
  },
  {
    'question': 'ID proof requirements for check-in',
    'answer': 'Yes, you should carry a valid govt. ID proof of the guests checking in. You can refer to the hotel booking policy to know more.'
  },
  {
    'question': 'Receipt or invoice for hotel bookings and payments',
    'answer': 'Please collect your invoice from the hotel at the time of check-out. Alternatively, please connect with the booking partner for the same.'
  },
  {
    'question': 'Feedback on the hotel stay experience',
    'answer': 'Feedback for your hotel stay experience can directly be shared with the hotel or booking partner.'
  },
  {
    'question': 'Contact details to report hotel related problems',
    'answer': 'The hotel should be your first point of contact for any problem during the stay. In case your issue remains unresolved, you can reach out to the booking partner.'
  },

];
