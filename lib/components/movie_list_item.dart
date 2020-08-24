import 'package:flutter/material.dart';
import 'package:movieezz/screens/movie_screen.dart';

import '../constant.dart';

class MovieListItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final String type;
  final String year;
  final String id;

  MovieListItem({this.imageURL, this.title, this.type, this.year, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieScreen(
              movieId: id,
            ),
          ),
        );
      },
      child: Card(
        borderOnForeground: true,
        elevation: 3.0,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(
                  imageURL,
                  width: 140.0,
                  height: 200.0,
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 22.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          title,
                          textAlign: TextAlign.left,
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'YEAR : $year',
                              style: kSubtitleTextStyle,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'TYPE : $type'.toUpperCase(),
                              style: kSubtitleTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
