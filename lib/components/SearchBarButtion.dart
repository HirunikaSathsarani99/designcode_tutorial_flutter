import 'package:flutter/material.dart';
import '../constants.dart';

class SerachbarButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            cursorColor: kPrimaryLabelColor,
            decoration:InputDecoration(
              icon:Icon(Icons.search,color: kPrimaryLabelColor,size: 20.0),
              border: InputBorder.none,
              hintText: "Search for courses",
              hintStyle: kSearchPlaceholderStyle,
            ),
            style: kSearchTextStyle,
            onChanged: (newText){
              print('NewText');
            },
          ),
        ),
      ),
    ));
    
  }
}
