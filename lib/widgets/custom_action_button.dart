import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomQuickActionButton extends StatefulWidget {
  const CustomQuickActionButton(
      {super.key,
      required this.quickActionName,
      required this.quickActionFunction,
      required this.iconPath});

  final String quickActionName;
  final VoidCallback quickActionFunction;
  final String iconPath;

  @override
  State<CustomQuickActionButton> createState() =>
      _CustomQuickActionButtonState();
}

class _CustomQuickActionButtonState extends State<CustomQuickActionButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: widget.quickActionFunction,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(
                color: const Color(0xffCBCACB),
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: SvgPicture.asset(widget.iconPath),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.quickActionName,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
