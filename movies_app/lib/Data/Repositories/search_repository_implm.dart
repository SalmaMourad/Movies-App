import '../../Domain/Models/movie.dart';
import '../../Domain/Repositories/search_repo.dart';
import '../DataSources/api_service.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiService apiService;

  SearchRepositoryImpl({required this.apiService});

  @override
  Future<List<Movie>> searchMovies(String queryTerm) async {
    final response = await apiService.getMovies(queryTerm: queryTerm);
    return response.data?.movies ?? [];
  }
}
