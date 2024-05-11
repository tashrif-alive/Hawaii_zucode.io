import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/views/contact_us/tab.dart';
import 'assurance.dart';
import 'booking_issues.dart';
import 'covidsafty.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Contact us',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 17,
                backgroundColor: Colors.black54,
                child: Icon(Icons.warning, size: 20, color: Colors.amber),
              ),
              title: Text("Please note:",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              subtitle: Text(
                  "hawaii representatives will never ask for any personal data like credit/debit card number, CVV, OTP, card details, userIDs, passwords,etc.Beware of any one who is claiming to be associate with airVenture. Acting on any requests may make victim of fraud, potentially leading to the loss of valuable information or money.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              tileColor: Colors.white,
            ),
            const SizedBox(
              height: 25,
            ),
            const ListTile(
              leading: Text("All Services"),
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.card_travel,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("Issue with Booking"),
              subtitle: Text("Facing issue with an existing booking",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IssuesBooking(),
                  ),
                );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.manage_accounts,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("Account Settings"),
              subtitle: Text("Update email,phone no. or password",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const UpdateProfile(),
                //   ),
                // );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.generating_tokens,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("hawaii Tokens"),
              subtitle: Text("View our money transaction details and rules",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PrebookigTabBar(),
                //   ),
                // );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("Pre-Booking Queries"),
              subtitle: Text("Facing issues while booking? Not able to book?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrebookingTabBar(),
                  ),
                );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.health_and_safety,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("COVID-19"),
              subtitle: Text("Facing issues due to virus",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Covid(),
                  ),
                );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.help,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("hawaii assured"),
              subtitle: Text("Get free cancellation benefits",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Assurance(),
                  ),
                );
              },
            ),
            const Divider(
              height: 1.5,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.currency_exchange,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              title: const Text("Manage Payment Methods"),
              subtitle: Text("Delete saved card or link/delink wallet",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 14)),
              trailing: const Icon(Icons.chevron_right),
              tileColor: Colors.white,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AddCard(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
