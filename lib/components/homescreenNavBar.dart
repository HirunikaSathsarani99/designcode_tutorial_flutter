import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/ProfileScreen.dart';
import 'SearchBarButtion.dart';
import 'sideBarButton.dart';

class HomeScreenNaveBar extends StatelessWidget {
  HomeScreenNaveBar({required this.triggerAnimation});
  final Function triggerAnimation;
  final photoURL = FirebaseAuth.instance.currentUser?.photoURL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          SideBarButton(
            triggerAnimation: triggerAnimation,
          ),
          SerachbarButton(),
          Icon(
            Icons.notification_add,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 8.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFFE7EEFB),
              child: (photoURL != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.network(
                        photoURL!,
                        width: 36.0,
                        height: 36.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(Icons.person),
              radius: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
