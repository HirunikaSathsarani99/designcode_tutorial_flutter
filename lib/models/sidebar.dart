import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidebarItem{

SlidebarItem({required this.title,required this.background,required this.icon});

  String title;
   LinearGradient background;
   Icon icon;

}
var slidebarItem =[
  SlidebarItem(
    title: "Home",
    background: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00AEFF),
                    Color(0xFF0076FF),
                  ]
                ), 
    icon: Icon(
      Icons.home, 
      color: Colors.white,)
  ),
  SlidebarItem(
    title: "Courses",
    background: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00AEFF),
                    Color(0xFF0076FF),
                  ]
                ), 
    icon: Icon(
      Platform.isAndroid?Icons.library_books:CupertinoIcons.book_solid, 
      color: Colors.white,)
  ),
  SlidebarItem(
    title: "Billing",
    background: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00AEFF),
                    Color(0xFF0076FF),
                  ]
                ), 
    icon: Icon(
      Icons.credit_card, 
      color: Colors.white,)
  ),
  SlidebarItem(
    title: "Setting",
    background: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00AEFF),
                    Color(0xFF0076FF),
                  ]
                ), 
    icon: Icon(
      Icons.settings, 
      color: Colors.white,)
  )
];