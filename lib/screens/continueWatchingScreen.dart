import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tutorial1/constants.dart';
import '../components/certificateViewer.dart';
import '../components/lists/continueCourseList.dart';


class ContinueWartchingWidget extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(34.0),
        topLeft: Radius.circular(34.0),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(
            color: kShadowColor, offset: Offset(0, -12), blurRadius: 32.0),
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                child: Container(
                  width: 42.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFC5CBD6),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Continue Watching",
                style: kTitle1Style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:24.0),
              child: ContinueWatchingList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Certificates",
                style: kTitle1Style,
              ),
            ),
            Expanded
            (child: CertificateViewr()),
          ],
        ),
      ),
    );
  }
}




