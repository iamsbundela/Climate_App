import 'package:flutter/material.dart';
import 'package:movieezz/components/movie_list_item.dart';
import 'package:movieezz/constant.dart';
import 'package:movieezz/services/movie.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchItem;
  int totalResults = 0;
  List<dynamic> listItems;
  MovieModel movie = MovieModel();
  List<MovieListItem> movieListItems = [];

  void updateUI(dynamic movieData) {
    setState(() {
      movieListItems.clear();
      if (movieData == null) {
        return;
      } else {
        listItems = movieData['Search'];

        for (var item in listItems) {
          movieListItems.add(
            MovieListItem(
              title: item['Title'],
              imageURL: item['Poster'],
              type: item['Type'],
              year: item['Year'],
              id: item['imdbID'],
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4947A7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22.0),
                    bottomRight: Radius.circular(22.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            decoration: kSearchFieldDecoration,
                            onChanged: (value) {
                              searchItem = value;
                            },
                            onSubmitted: (searchItem) async {
                              var searchData =
                                  await movie.getResultsByName(searchItem);
                              updateUI(searchData);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Material(
                          color: Color(0xFF5F5EB7),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Popular',
                              style: kCategoryChipStyle,
                            ),
                          ),
                        ),
                        Material(
                          color: Color(0xFF5F5EB7),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Trending',
                              style: kCategoryChipStyle,
                            ),
                          ),
                        ),
                        Material(
                          color: Color(0xFF5F5EB7),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Recent',
                              style: kCategoryChipStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                child: ListView(
                  children: movieListItems.sublist(0, movieListItems.length),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
