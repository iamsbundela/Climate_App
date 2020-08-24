import 'package:flutter/material.dart';

const textColor = Color(0xFF483689);
const primaryColor = Color(0xFF5F5EB7);

const kSubtitleTextStyle = TextStyle(
  fontSize: 13.0,
  color: Colors.black54,
  fontWeight: FontWeight.w500,
);

const kTitleTextStyle = TextStyle(
  fontSize: 24.0,
  color: textColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
);

const kSearchFieldDecoration = InputDecoration(
  hintText: 'Movie or Series Name',
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(35.0),
    ),
  ),
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(35.0),
    ),
  ),
);

const kCategoryChipStyle = TextStyle(
  fontSize: 18.0,
  backgroundColor: primaryColor,
  color: Colors.white,
);
