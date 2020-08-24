import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieezz/components/info_widget.dart';
import 'package:movieezz/components/rating_widget.dart';
import 'package:movieezz/constant.dart';
import 'package:movieezz/services/movie.dart';

class MovieScreen extends StatefulWidget {
  static String id = 'movie_screen';
  final String movieId;
  MovieScreen({this.movieId});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieModel movie = MovieModel();
  String movieTitle = '';
  String moviePoster = '';
  String movieRuntime = '';
  String movieYear = '';
  String movieGenre = '';
  String imdb = '';
  String metacritic = '';
  String moviePlot = '';
  String movieRelease = '';
  String movieDirector = '';
  String movieActors = '';
  String movieProduction = '';
  String movieWriters = '';

//  String rottenTomatoes = '';
  void updateUI(dynamic movieData) {
    setState(() {
      if (movieData == null) {
        return;
      } else {
        movieTitle = movieData['Title'];
        moviePoster = movieData['Poster'];
        movieRuntime = movieData['Runtime'];
        movieYear = movieData['Year'];
        movieGenre = movieData['Genre'];
        imdb = movieData['imdbRating'];
//        rottenTomatoes = movieData['Ratings'][1].Value;
        metacritic = movieData['Metascore'];
        movieActors = movieData['Actors'];
        moviePlot = movieData['Plot'];
        movieRelease = movieData['Released'];
        movieDirector = movieData['Director'];
        movieProduction = movieData['Production'];
        movieWriters = movieData['Writer'];
      }
    });
  }

  dynamic getMovieId() async {
//    String movieId = widget.movieId;
    var movieData = await movie.getMovieById(widget.movieId);
    print(movieData);
    updateUI(movieData);
  }

  @override
  void initState() {
    getMovieId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      moviePoster,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        size: 35.0,
                        //TODO: Change Color to white
                        color: Colors.white,
                      ),
                      Text(
                        movieTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Runtime : $movieRuntime',
                            style: kSubtitleTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            width: 45.0,
                          ),
                          Text(
                            'Year : $movieYear',
                            style: kSubtitleTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      //TODO: Put these Genre in Chips
                      Row(
                        children: <Widget>[
                          Text(
                            movieGenre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RatingWidget(
                    name: 'IMDB',
                    score: '$imdb / 10',
                  ),
//                  RatingWidget(
//                    name: 'Rotten Tomatoes',
//                    score: '80%',
//                  ),
                  RatingWidget(
                    name: 'Metacritic',
                    score: '$metacritic%',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          InfoWidget(
                            title: 'Release Date : ',
                            value: movieRelease,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          InfoWidget(
                            title: 'Director : ',
                            value: movieDirector,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          InfoWidget(
                            title: 'Production : ',
                            value: movieProduction,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              NameWidget(
                title: 'Actors',
                name: movieActors,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Storyline :',
                      textAlign: TextAlign.left,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      moviePlot,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0x86000000),
                        fontSize: 20.0,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              NameWidget(
                title: 'Writers',
                name: movieWriters,
              ),
              Container(
                padding: EdgeInsets.only(top: 25.0),
                child: Image.network(
                  moviePoster,
                ),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
