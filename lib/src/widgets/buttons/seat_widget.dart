import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Seat extends StatelessWidget {
  final int sL;
  final List<int> info;
  final Function(int row, int column) seaTonTap;

  const Seat(
      {super.key,
      required this.sL,
      required this.info,
      required this.seaTonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleSeat(status: info[0], seaTonTap: seaTonTap, r: sL, c: 0),
        SingleSeat(status: info[1], seaTonTap: seaTonTap, r: sL, c: 1),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.grey.shade50,
          ),
          height: 40,
          width: 40,
          child: Center(
            child: Text((sL + 1).toString(),
                style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
        ),
        SingleSeat(status: info[2], seaTonTap: seaTonTap, r: sL, c: 2),
        SingleSeat(status: info[3], seaTonTap: seaTonTap, r: sL, c: 3),
      ],
    );
  }
}

class SingleSeat extends StatelessWidget {
  final int status;
  final Function(int row, int column) seaTonTap;
  final int r;
  final int c;

  const SingleSeat({
    super.key,
    required this.status,
    required this.seaTonTap,
    required this.r,
    required this.c,
  });

  @override
  Widget build(BuildContext context) {
    if (status == 1) {
      return InkWell(
        onTap: ()=>seaTonTap(r,c),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87, // Border color
              width: 2, // Border width
            ),
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          child: Container(
            color: Colors.black26,
            height: 36,
            width: 36,
          ),
        ),
      );
    }
    if (status == 2) {
      return InkWell(
        onTap: ()=>seaTonTap(r,c),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black,
          ),
          height: 40,
          width: 40,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black12,
      ),
      height: 40,
      width: 40,
    );
  }
}
