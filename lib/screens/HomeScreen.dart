import 'package:flutter/material.dart';
import 'package:tutorial1/screens/continueWatchingScreen.dart';
import 'package:tutorial1/screens/sideBarScreen.dart';
import '../components/homescreenNavBar.dart';
import '../components/lists/exploreCourseList.dart';
import '../components/lists/recentCourseList.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;
  late Animation<double> fadeAnimation;
  var sidebarHidden = true;
  
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeScreenNaveBar(
                    triggerAnimation: () {
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
                      sidebarAnimationController.forward();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Recents',
                          style: kLargeTitleStyle,
                        ),
                        Text(
                          '23 courses, more coming',
                          style: kSubtitleStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RecentCourcesList(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Explore",
                          style: kTitle1Style,
                        ),
                      ],
                    ),
                  ),
                  ExploreCouseList(),
                ],
              ),
            ),
          ),
          ContinueWartchingWidget(),
          IgnorePointer(
            ignoring: sidebarHidden,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: GestureDetector(
                    child: Container(
                      color: Color.fromRGBO(36, 38, 41, 0.4),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    onTap: () {
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
                      sidebarAnimationController.reverse();
                    },
                  ),
                ),
                SlideTransition(
                  position: sidebarAnimation,
                  child: SafeArea(
                    child: SideBarScreen(),
                    bottom: false,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

