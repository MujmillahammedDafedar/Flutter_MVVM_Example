import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_flutter/Model/movie_entity.dart';

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    final url = "http://www.omdbapi.com/?s=$keyword&apikey=dc448f6e";
    final response = await http.get(url);
    if(response.statusCode == 200) {

      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie
          .fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}