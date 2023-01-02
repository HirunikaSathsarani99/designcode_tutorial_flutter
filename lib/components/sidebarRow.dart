import 'package:flutter/material.dart';
import 'package:tutorial1/constants.dart';
import 'package:tutorial1/models/sidebar.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({required this.item});
  final SlidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
    Container(
      width: 42.0, 
      height: 42.0,
      padding: EdgeInsets.all(10.0), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        gradient:item.background
      ),
      child: item.icon
        ),
    SizedBox(
      width: 12,
    ),
    Container(
      child: Text(
        item.title,
        style:kCalloutLabelStyle,
      ),
    ),
          ],
        );
  }
}