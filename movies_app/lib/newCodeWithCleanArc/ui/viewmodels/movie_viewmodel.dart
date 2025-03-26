import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

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
