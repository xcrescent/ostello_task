import 'package:anchor_tabs/anchor_tabs.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_anchorlable/anchorlable_controller.dart';
import 'package:flutter_anchorlable/anchorlable_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_task/constants/constants.dart';
import 'package:ostello_task/screens/tabs/overview_tab.dart';
import 'package:ostello_task/widgets/coaching_details_widget.dart';
import 'package:ostello_task/widgets/verified_tag.dart';

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

final anchorController = AnchorlableController();

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget buildCustomTab(
        VoidCallback onPressed, String label, bool isSelected) {
      return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, -10),
                    ),
                  ],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: isSelected ? Colors.black : Colors.transparent,
                  decorationThickness: 2,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
    }

    GlobalKey selectedKey = anchorKeys[0];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnchorlableScrollColumn(
          controller: anchorController,
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
                      .copyWith(
                          top: MediaQuery.of(context).size.height * 0.2),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: horizontalMenus.map(
                  (menu) {
                    GlobalObjectKey anchorKey;
                    if (menu == "Overview") {
                      anchorKey = anchorKeys[0];
                    } else if (menu == "Courses") {
                      anchorKey = anchorKeys[1];
                    } else if (menu == "Amenities") {
                      anchorKey = anchorKeys[2];
                    } else {
                      anchorKey = anchorKeys[3];
                    }
                    return buildCustomTab(
                      () async {
                        await anchorController.animateToAnchor(
                          anchorKey,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                        setState(() {
                          selectedKey = anchorKey;
                        });
                      },
                      menu,
                      selectedKey == anchorKey,
                    );
                  },
                ).toList(),
              ),
            ),
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
            // SizedBox(
            //   width: double.maxFinite,
            //   height: 500,
            //   child: ContainedTabBarView(
            //     tabs: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0).copyWith(left: 0),
            //         child: Text(
            //           'Overview',
            //           style: GoogleFonts.lato(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w800,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Courses',
            //           style: GoogleFonts.lato(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w800,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Amenities',
            //           style: GoogleFonts.lato(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w800,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'About institution',
            //           style: GoogleFonts.lato(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w800,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ],
            //     tabBarProperties: TabBarProperties(
            //       width: double.maxFinite,
            //       alignment: TabBarAlignment.start,
            //       height: 40,
            //       isScrollable: true,
            //       indicatorSize: TabBarIndicatorSize.tab,
            //       indicatorColor: Colors.black,
            //       indicatorWeight: 1.0,
            //       labelColor: Colors.black,
            //       unselectedLabelColor: Colors.grey[400],
            //     ),
            //     views: [
            //       const OverviewTab(),
            //       Container(color: Colors.green),
            //       Container(color: Colors.red),
            //       Container(color: Colors.green),
            //     ],
            //     onChange: (index) => print(index),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
