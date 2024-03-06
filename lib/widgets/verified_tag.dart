import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class VerifiedTag extends StatelessWidget {
  const VerifiedTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xff374BFE),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Verified',
            style: GoogleFonts.lato(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Image.asset(Images.verifiedTag,
          scale: 4,),
        ],
      ),
    );
  }
}
