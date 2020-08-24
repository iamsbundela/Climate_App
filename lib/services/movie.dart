import 'networking.dart';

const String apiKey = 'c3f7454b';
const String omdbURL = 'http://www.omdbapi.com/';

class MovieModel {
  Future<dynamic> getResultsByName(String name) async {
    NetworkHelper networkHelper =
        NetworkHelper('$omdbURL?apikey=$apiKey&s=$name');
    var resultData = await networkHelper.getData();
    return resultData;
  }

  Future<dynamic> getMovieById(String movieId) async {
    NetworkHelper networkHelper =
        NetworkHelper('$omdbURL?apikey=$apiKey&i=$movieId&plot=full');
    var resultData = await networkHelper.getData();
    return resultData;
  }
}
