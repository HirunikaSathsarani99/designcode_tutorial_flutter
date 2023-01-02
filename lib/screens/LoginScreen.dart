import 'package:flutter/material.dart';
import 'package:tutorial1/screens/HomeScreen.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String Password;
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  Future<void> createNewUserData() async{
  _firestore.collection('users').doc(_auth.currentUser?.uid).set({
    'name': 'User',
    'uid': _auth.currentUser?.uid,
    'bio': 'Design+Code student',
    'completed': [],
    'recents': [],
    'badges': [],
    'certificates': [],
    'profilePic': ''
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSidebarBackgroundColor,
        child: ListView(children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    transform: Matrix4.translationValues(0, -75, 0),
                    child:
                        Image.asset('asset/illustrations/illustration-14.png'),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -170, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Learn to design\nand code apps',
                          style: kLargeTitleStyle.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'Completed courses about the best\ntools and design systems',
                          style: kHeadlineLabelStyle.copyWith(
                              color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0, -150, 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 53.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Log in to',
                        style: kTitle1Style,
                      ),
                      Text(
                        'Srart learning',
                        style: kTitle1Style.apply(color: Color(0xFF5B4CF0)),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor,
                              offset: Offset(0, 12),
                              blurRadius: 16.0,
                            ),
                          ],
                        ),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5.0,
                              right: 16.0,
                              left: 16.0,
                            ),
                            child: TextField(
                              cursorColor: kPrimaryLabelColor,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Color(0xFF5488F1),
                                  size: 20.0,
                                ),
                                border: InputBorder.none,
                                hintText: "Email Address",
                                hintStyle: kLoginInputTextStyle,
                              ),
                              style: kLoginInputTextStyle.copyWith(
                                  color: Colors.black),
                              onChanged: (textEntered) {
                                email = textEntered;
                                //print(email);
                              },
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 5.0,
                              right: 16.0,
                              left: 16.0,
                            ),
                            child: TextField(
                              cursorColor: kPrimaryLabelColor,
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Color(0xFF5488F1),
                                  size: 20.0,
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: kLoginInputTextStyle,
                              ),
                              style: kLoginInputTextStyle.copyWith(
                                  color: Colors.black),
                              onChanged: (textEntered) {
                                Password = textEntered;
                                //print(Password);
                              },
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: Password);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                    fullscreenDialog: false,
                                  ),
                                );
                              } on FirebaseAuthException catch (err) {
                                if (err.code == "user-not-found") {
                                  try {
                                    await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: Password)
                                        .then(
                                      (user) {
                                        createNewUserData();
                                        user.user?.sendEmailVerification();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                            fullscreenDialog: false,
                                          ),
                                        );
                                      },
                                    );
                                  } catch (err) {}
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(err.message.toString()),
                                        actions: [
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Ok!"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              child: Text(
                                "Login",
                                style: kCalloutLabelStyle.copyWith(
                                    color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF73A0F4),
                                    Color(0xFF4A47F5),
                                  ],
                                ),
                              ),
                              height: 47.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          _auth
                              .sendPasswordResetEmail(email: email)
                              .then((value) => {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Email sent"),
                                            content: Text(
                                                "The password reset email has been sent!"),
                                            actions: [
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("OK!"),
                                              ),
                                            ],
                                          );
                                        })
                                  });
                        },
                        child: Container(
                          child: Text(
                            "Forgot Password?",
                            style: kCalloutLabelStyle.copyWith(
                              color: Color(0x721B1E9C),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
