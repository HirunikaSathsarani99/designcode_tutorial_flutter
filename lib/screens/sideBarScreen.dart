import 'package:flutter/material.dart';
import 'package:tutorial1/components/sidebarRow.dart';
import 'package:tutorial1/constants.dart';
import 'package:tutorial1/models/sidebar.dart';

class SideBarScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0)
        )
       ),
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width * 0.8,
       padding:EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0
       ) ,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:AssetImage('asset/images/profile.jpg'),
                    radius: 31.0 ,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Name',
                      style: kHeadlineLabelStyle
                      ,),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Licence expire 2021',
                      style: kSearchPlaceholderStyle
                      ,)
                    ],
                  )
                ],
                
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              SidebarRow(item: slidebarItem[0],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(item: slidebarItem[1],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(item: slidebarItem[2],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(item: slidebarItem[3],
              ),
              SizedBox(
                height: 32.0,
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    'asset/icons/icon-logout.png',
                    width: 17.0
                    ,),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Log Out',
                      style: kSecondaryCalloutLabelStyle,)
                ],
              )
            ],
          ),
        ));
  }
}


