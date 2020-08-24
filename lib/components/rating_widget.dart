import 'package:flutter/material.dart';
import 'package:movieezz/constant.dart';

class RatingWidget extends StatelessWidget {
  final String score;
  final String name;

  RatingWidget({this.score, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$score',
          style: TextStyle(
            fontSize: 20.0,
            color: textColor,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 18.0,
            color: textColor,
          ),
        )
      ],
    );
  }
}
