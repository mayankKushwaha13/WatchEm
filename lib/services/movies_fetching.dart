import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watchem/utils/api.dart';


Future<List?> getTrending() async {
  var response = await http.get(Uri.parse("$url/popular"), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken'
  });

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body.toString());
    List<dynamic> results = json['results'];
    return results;
  }
  return null;
}

Future<List?> getNowPlaying() async {
  var response = await http.get(Uri.parse("$url/now_playing"), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken'
  });

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body.toString());
    List<dynamic> results = json['results'];
    return results;
  }
  return null;
}

Future<List?> getTopRated() async {
  var response = await http.get(Uri.parse("$url/top_rated"), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken'
  });

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body.toString());
    List<dynamic> results = json['results'];
    return results;
  }
  return null;
}

List<Map<String, dynamic>> genres = [
  {"id": 28, "name": "Action"},
  {"id": 12, "name": "Adventure"},
  {"id": 16, "name": "Animation"},
  {"id": 35, "name": "Comedy"},
  {"id": 80, "name": "Crime"},
  {"id": 99, "name": "Documentary"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Family"},
  {"id": 14, "name": "Fantasy"},
  {"id": 36, "name": "History"},
  {"id": 27, "name": "Horror"},
  {"id": 10402, "name": "Music"},
  {"id": 9648, "name": "Mystery"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Science Fiction"},
  {"id": 10770, "name": "TV Movie"},
  {"id": 53, "name": "Thriller"},
  {"id": 10752, "name": "War"},
  {"id": 37, "name": "Western"}
];