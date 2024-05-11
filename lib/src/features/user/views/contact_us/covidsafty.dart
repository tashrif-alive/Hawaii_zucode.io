import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Covid extends StatefulWidget {
  const Covid({super.key});

  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
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
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Get.back()),
        elevation: 0,
        title: Text("Covid-19 FAQs",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpandedList[index] = !isExpanded;
            });
          },
          children: faqData.asMap().entries.map<ExpansionPanel>((entry) {
            int index = entry.key;
            Map<String, String> faq = entry.value;
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(faq['question']!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                );
              },
              body: ListTile(
                title: Text(faq['answer']!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    )),
              ),
              isExpanded: _isExpandedList[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}

List<Map<String, String>> faqData = [
  {
    'question': 'How to reschedule my booking due to COVID-19?',
    'answer':
        'To reschedule your booking, please visit the "My Trip" section on our website and select your booking to initiate a reschedule request. For further assistance, contact our customer support.',
  },
  {
    'question':
        'What are the travel guidelines for international passengers arriving in Bangladesh?',
    'answer':
        'All international passengers arriving in Bangladesh must adhere to the latest travel guidelines issued by the government. Please check the official website for the most up-to-date information or contact our support.',
  },
];
