import 'package:flutter/material.dart';
import 'package:movieezz/constant.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String value;

  InfoWidget({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: textColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
