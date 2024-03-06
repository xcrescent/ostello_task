import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostello_task/constants/constants.dart';
import 'package:ostello_task/widgets/custom_action_button.dart';

class CoachingDetailsWidget extends ConsumerStatefulWidget {
  const CoachingDetailsWidget({
    super.key,
    required this.coachingName,
    required this.rating,
    required this.noOfRatings,
    required this.yearsInBusiness,
    required this.address,
    required this.distanceInKms,
  });

  final String coachingName;
  final String rating;
  final String noOfRatings;
  final String yearsInBusiness;
  final String address;
  final String distanceInKms;

  @override
  ConsumerState createState() => _CoachingDetailsWidgetState();
}

class _CoachingDetailsWidgetState extends ConsumerState<CoachingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // COACHING NAME
            Text(
              widget.coachingName,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            // RATINGS
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                  decoration: BoxDecoration(
                    color: Constants.positiveRatingColor,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.rating,
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      SvgPicture.asset(SvgImages.ratingStar),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "${widget.noOfRatings} ratings   •   ${widget.yearsInBusiness}+ Years in business",
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // ADDRESS & DISTANCE
            const SizedBox(
              height: 12,
            ),
            Text(
              "${widget.address}  •   ${widget.distanceInKms} kms",
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Availability
            const SizedBox(
              height: 12,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Open Now:',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff029C42),
                    ),
                  ),
                  TextSpan(
                    text: " Until 9:00 pm",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0C0C0C),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(
                height: 1,
                color: Colors.grey.shade200,
              ),
            ),
            // Quick Menus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomQuickActionButton(
                    quickActionName: 'Direction',
                    quickActionFunction: () {},
                    iconPath: SvgImages.directionIcon),
                CustomQuickActionButton(
                    quickActionName: 'Favorite',
                    quickActionFunction: () {},
                    iconPath: SvgImages.favoriteIcon),
                CustomQuickActionButton(
                    quickActionName: 'Review',
                    quickActionFunction: () {},
                    iconPath: SvgImages.reviewIcon),
                CustomQuickActionButton(
                    quickActionName: 'Share',
                    quickActionFunction: () {},
                    iconPath: SvgImages.shareIcon),
              ],
            )
          ],
        ),
      ),
    );
  }
}
