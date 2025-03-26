import 'package:flutter/material.dart';
import '../../../Domain/Models/movie.dart';
import '../../../Domain/UseCases/get_movies_usecase.dart';

class MovieViewModel extends ChangeNotifier {
  final GetMoviesUseCase getMoviesUseCase;
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  MovieViewModel({required this.getMoviesUseCase});

  Future<void> loadMovies({String? genre}) async {
    _isLoading = true;
    notifyListeners();
    
    _movies = await getMoviesUseCase.call(genre: genre);
    
    _isLoading = false;
    notifyListeners();
  }
}
