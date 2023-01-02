import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../cards/exploreCourseCard.dart';

class ExploreCouseList extends StatefulWidget {
  @override
  State<ExploreCouseList> createState() => _ExploreCouseListState();
}

class _ExploreCouseListState extends State<ExploreCouseList> {
  List<Course> exploreCourses = [];

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    grabCourses();
  }

  void grabCourses() {
  _firestore.collection("courses").get().then((snapshot) {
    snapshot.docs.forEach((doc) {
      setState(() {
        exploreCourses.add(Course(
            courseTitle: doc["courseTitle"],
            courseSubtitle: doc["courseSubtitle"],
            illustration: doc["illustration"],
            logo: doc["logo"],
            background: LinearGradient(colors: [
              Color(int.parse(doc["Color"][0])),
              Color(int.parse(doc["Color"][1])),
            ])));
      });
    });
  });
}

  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ExploreCourseCard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}
