import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_task/widgets/custom_chip.dart';
import 'package:ostello_task/widgets/custom_filter_menu_button.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

List<String> _categories = [
  'Academics',
  'Competitive Exams',
  'Skills',
  'Other Skills',
  'Commerce'
];

class _OverviewTabState extends State<OverviewTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0).copyWith(top: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Categories',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          Wrap(
            children: _categories
                .map(
                  (category) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: CustomChip(chipName: category),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'All Courses',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomFilterMenuButton(),
        ],
      ),
    );
  }
}
