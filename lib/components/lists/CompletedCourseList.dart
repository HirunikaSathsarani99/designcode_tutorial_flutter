import 'package:flutter/material.dart';
import 'package:tutorial1/components/cards/CompletedCourseCards.dart';
import 'package:tutorial1/models/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompletedCourseList extends StatefulWidget {
  @override
  State<CompletedCourseList> createState() => _CompletedCourseListState();
}

class _CompletedCourseListState extends State<CompletedCourseList> {
  @override
  List<Container> indicators = [];
  int currentPage = 0;
  var completedCourses = [];
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void initState() {
    super.initState();
    getCompletedCourses();
  }

  void getCompletedCourses() {
     _firestore
    .collection("users")
    .doc(_auth.currentUser?.uid)
    .get()
    .then((snapshot) {
	    for (var course in snapshot["completed"]) {
	      _firestore
          .collection("courses")
          .doc(course)
          .get()
          .then((courseSnapshot) {
			      setState(() {
		          completedCourses.add(Course(
								courseTitle: courseSnapshot["courseTitle"],
	              courseSubtitle: courseSnapshot["courseSubtitle"],
	              illustration: courseSnapshot["illustration"],
	              logo: courseSnapshot["logo"],
	              background: LinearGradient(colors: [
			            Color(int.parse(courseSnapshot["Color"][0])),
	                Color(int.parse(courseSnapshot["Color"][1])),
			          ])));
		        });
		      });
			}
	  });
  }

  Widget UpdateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: completedCourses.map(
        (course) {
          var index = completedCourses.indexOf(course);
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
            itemBuilder: (context, index) {
              return Opacity(
                opacity: currentPage == index ? 1.0 : 0.5,
                child: CompletedCourseCard(
                  course: completedCourses[index],
                ),
              );
            },
            itemCount: completedCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        UpdateIndicators(),
      ],
    );
  }
}
