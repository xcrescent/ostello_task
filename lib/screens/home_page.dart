import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello_task/constants/constants.dart';
import 'package:ostello_task/screens/tabs/overview_tab.dart';
import 'package:ostello_task/widgets/coaching_details_widget.dart';
import 'package:ostello_task/widgets/verified_tag.dart';

import '../ext_pkg/anchor_tabs/anchor_tabs.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

final List<String> horizontalMenus = [
  "Overview",
  "Courses",
  "Amenities",
  "About Institution",
];

List<GlobalObjectKey> anchorKeys = const [
  GlobalObjectKey('overviewKey'),
  GlobalObjectKey('coursesKey'),
  GlobalObjectKey('amenitiesKey'),
  GlobalObjectKey('aboutKey')
];

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Widget buildCustomTab(
    //     VoidCallback onPressed, String label, bool isSelected) {
    //   return InkWell(
    //     onTap: onPressed,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             label,
    //             style: TextStyle(
    //               shadows: const [
    //                 Shadow(
    //                   color: Colors.black,
    //                   offset: Offset(0, -10),
    //                 ),
    //               ],
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.bold,
    //               decoration: TextDecoration.underline,
    //               decorationStyle: TextDecorationStyle.solid,
    //               decorationColor:
    //                   isSelected ? Colors.black : Colors.transparent,
    //               decorationThickness: 2,
    //               color: Colors.transparent,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // GlobalKey selectedKey = anchorKeys[0];
    final DateTime today = DateTime.now();

    final List<String> tabsText = [
      'Today',
      'Yesterday',
    ];

    // for (int i = 2; i < 10; i++) {
    //   final DateTime pastDate = today.subtract(Duration(days: i));
    //   tabsText.add('${pastDate.day}/${pastDate.month}');
    // }

    final List<Widget> tabs = horizontalMenus
        .map(
          (menu) => Text(menu),
        )
        .toList();
    final List<Widget> body = [
      OverviewTab(
        key: anchorKeys[0],
      ),
      Container(
        color: Colors.blue,
        width: double.infinity,
        height: 500,
        key: anchorKeys[1],
      ),
      Container(
        width: double.infinity,
        height: 500,
        color: Colors.red,
        key: anchorKeys[2],
      ),
      Container(
        color: Colors.green,
        width: double.infinity,
        height: 500,
        key: anchorKeys[3],
      ),
    ];

    // for (final element in tabsText) {
    //   // Create a tab item
    //   tabs.add(Text(element));
    //
    //   // Create a target item
    //   body.add(
    //     ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       controller: ScrollController(),
    //       itemCount: 40,
    //       itemBuilder: (BuildContext ctxt, int i) => Text(
    //         '$element  $i',
    //         style: Theme.of(ctxt).textTheme.headlineSmall,
    //       ),
    //     ),
    //   );
    // }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  Images.coachingImage,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Align(
                    widthFactor: 1,
                    alignment: Alignment.topLeft,
                    child: VerifiedTag(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 18)
                      .copyWith(top: MediaQuery.of(context).size.height * 0.2),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: CoachingDetailsWidget(
                      coachingName: "Indian Coaching Institute",
                      rating: "3.8",
                      noOfRatings: "133",
                      yearsInBusiness: "12",
                      address: "Marthandam North, Kanyakumari",
                      distanceInKms: "3",
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: AnchorTabPanel(
                tabs: tabs,
                body: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
