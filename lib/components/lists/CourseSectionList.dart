import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/course.dart';
import '../../screens/courseScreen.dart';
import '../cards/CourseSectionCard.dart';

class CourseSectionList extends StatelessWidget {

  List<Widget> courseSectionsWidgets() {
  List<Widget> cards = [];
  
  for (var course in courseSections) {
    cards.add(
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: CourseSectionCard(
          course: course,
        ),
      ),
    );
  }
   cards.add(
      Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          "No more Sections to view, look\nfor more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return cards;
}
  
  @override
  Widget build(BuildContext context) {
    return Expanded
    (child: ListView(
      children: courseSectionsWidgets(),
      )
      
    );
    
  }
}