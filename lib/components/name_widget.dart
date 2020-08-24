import 'package:flutter/material.dart';
import 'package:movieezz/constant.dart';

class NameWidget extends StatelessWidget {
  final String title;
  final String name;

  NameWidget({this.title, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 22.0),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title :',
                textAlign: TextAlign.left,
                style: kTitleTextStyle,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                name,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
