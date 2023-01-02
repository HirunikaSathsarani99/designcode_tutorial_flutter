import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../cards/continueWatchingCards.dart';

class ContinueWatchingList extends StatefulWidget {
  
  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
   List<Container> indicators = [];
  int currentPage = 0;

   Widget UpdateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map(
        (course) {
          var index = continueWatchingCourses.indexOf(course);
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context,index){
              return Opacity(
                opacity: currentPage==index? 1.0:0.5,
                child: ContinueWartchingCard(course: continueWatchingCourses[index],
                ),
              );
            },
            itemCount: continueWatchingCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
             onPageChanged: (index) {
            setState(() {
              currentPage=index;
            });
          },
            ),
        ),
        UpdateIndicators(),
      ],
    );
    
  }
}