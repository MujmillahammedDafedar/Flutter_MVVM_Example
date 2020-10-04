import 'package:flutter/material.dart';
import 'package:mvvm_flutter/Service/webService.dart';
import 'package:mvvm_flutter/ViewModel/viewmodel.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners();
  }

}