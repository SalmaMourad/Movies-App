import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsCubit.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieDetailsScreenFinal.dart';
import 'package:movies_app/MovieDetailsScreennnn/movie_details_repository.dart';
// import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_screen.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsRepository.dart';
import '../../Data/DataSources/api_service.dart';
import '../../Data/Repositories/movie_repository_impl.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
  final movieSuggestionsRepository = MovieSuggestionsRepository(apiService: apiService);

  runApp(MyApp(
    movieRepository: movieRepository,
    movieDetailsRepository: movieDetailsRepository,
    movieSuggestionsRepository: movieSuggestionsRepository,
  ));
}

class MyApp extends StatelessWidget {
  final MovieRepositoryImpl movieRepository;
  final MovieDetailsRepository movieDetailsRepository;
  final MovieSuggestionsRepository movieSuggestionsRepository;

  MyApp({
    required this.movieRepository,
    required this.movieDetailsRepository,
    required this.movieSuggestionsRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: movieRepository),
        RepositoryProvider.value(value: movieDetailsRepository),
        RepositoryProvider.value(value: movieSuggestionsRepository),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => MovieSuggestionsCubit(
            repository: context.read<MovieSuggestionsRepository>(),
          ),
          child: MovieDetailsScreen(movieId: 15),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// // import 'package:movies_app/Domain/UseCases/get_movie_suggestions_usecase.dart';
// import 'package:movies_app/Domain/UseCases/usecase.dart';
// import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/MovieSuggestionsCubit.dart';
// import 'package:movies_app/ammmmmmmmmmm/repo.dart';
// import 'package:movies_app/ammmmmmmmmmm/s.dart';
// import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
// import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/cc.dart';
// import '../../Data/DataSources/api_service.dart';
// import '../../Data/Repositories/movie_repository_impl.dart';
// // import '../../Presentation/Blocs/movie_suggestions_cubit.dart';

// // main.dart
// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio);
//   final movieRepository = MovieRepositoryImpl(apiService: apiService);
//   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
//   final movieSuggestionsRepository = MovieSuggestionsRepository(apiService: apiService);

//   runApp(MyApp(
//     movieRepository: movieRepository,
//     movieDetailsRepository: movieDetailsRepository,
//     movieSuggestionsRepository: movieSuggestionsRepository,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final MovieRepositoryImpl movieRepository;
//   final MovieDetailsRepository movieDetailsRepository;
//   final MovieSuggestionsRepository movieSuggestionsRepository;

//   MyApp({
//     required this.movieRepository,
//     required this.movieDetailsRepository,
//     required this.movieSuggestionsRepository,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider.value(value: movieRepository),
//         RepositoryProvider.value(value: movieDetailsRepository),
//         RepositoryProvider.value(value: movieSuggestionsRepository),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MovieDetailsScreen(movieId: 15),
//       ),
//     );
//   }
// }
// In your main.dart or wherever you create the MovieDetailsScreen

// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio);
//   final movieRepository = MovieRepositoryImpl(apiService: apiService);
//   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
//   final getMovieSuggestionsUseCase = GetMovieSuggestionsUseCase(movieRepository);

//   runApp(MyApp(
//     getMovieSuggestionsUseCase: getMovieSuggestionsUseCase,
//     movieDetailsRepository: movieDetailsRepository,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final GetMovieSuggestionsUseCase getMovieSuggestionsUseCase;
//   final MovieDetailsRepository movieDetailsRepository;

//   MyApp({required this.getMovieSuggestionsUseCase, required this.movieDetailsRepository});

//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider.value(value: getMovieSuggestionsUseCase),
//         RepositoryProvider.value(value: movieDetailsRepository),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider<MovieSuggestionsCubit>(
//             create: (context) => MovieSuggestionsCubit(getMovieSuggestionsUseCase), // ✅ Fix: Wrap inside MultiBlocProvider
//           ),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: MovieDetailsScreen(movieId: 1), // ✅ Make sure this screen needs the provider
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:dio/dio.dart';
// // // import 'package:movies_app/Domain/UseCases/get_movie_suggestions_usecase.dart';
// // import 'package:movies_app/Domain/UseCases/usecase.dart';
// // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/MovieSuggestionsCubit.dart';
// // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
// // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/cc.dart';
// // import '../../Data/DataSources/api_service.dart';
// // import '../../Data/Repositories/movie_repository_impl.dart';
// // // import '../../Presentation/Blocs/movie_suggestions_cubit.dart';

// // void main() {
// //   final dio = Dio();
// //   final apiService = ApiService(dio);
// //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// //   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);

// //   // ✅ Create an instance of GetMovieSuggestionsUseCase using movieRepository
// //   final getMovieSuggestionsUseCase = GetMovieSuggestionsUseCase(movieRepository);

// //   runApp(MyApp(
// //     getMovieSuggestionsUseCase: getMovieSuggestionsUseCase,
// //     movieDetailsRepository: movieDetailsRepository,
// //   ));
// // }

// // class MyApp extends StatelessWidget {
// //   final GetMovieSuggestionsUseCase getMovieSuggestionsUseCase;
// //   final MovieDetailsRepository movieDetailsRepository;

// //   MyApp({required this.getMovieSuggestionsUseCase, required this.movieDetailsRepository});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiRepositoryProvider(
// //       providers: [
// //         RepositoryProvider.value(value: getMovieSuggestionsUseCase),
// //         RepositoryProvider.value(value: movieDetailsRepository),
// //       ],
// //       child: MultiBlocProvider(
// //         providers: [
// //           BlocProvider<MovieSuggestionsCubit>(
// //             create: (context) => MovieSuggestionsCubit(getMovieSuggestionsUseCase), // ✅ Pass the correct type
// //           ),
// //         ],
// //         child: MaterialApp(
// //           debugShowCheckedModeBanner: false,
// //           home: MovieDetailsScreen(movieId: 15),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/MovieSuggestionsCubit.dart';
// // // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
// // // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/cc.dart';
// // // import '../../Data/DataSources/api_service.dart';
// // // import '../../Data/Repositories/movie_repository_impl.dart';
// // // // import '../../Presentation/Blocs/movie_suggestions_cubit.dart'; // Import your Cubit

// // // void main() {
// // //   final dio = Dio();
// // //   final apiService = ApiService(dio);
// // //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// // //   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);

// // //   runApp(MyApp(
// // //     movieRepository: movieRepository,
// // //     movieDetailsRepository: movieDetailsRepository,
// // //   ));
// // // }

// // // class MyApp extends StatelessWidget {
// // //   final MovieRepositoryImpl movieRepository;
// // //   final MovieDetailsRepository movieDetailsRepository;

// // //   MyApp({required this.movieRepository, required this.movieDetailsRepository});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MultiRepositoryProvider(
// // //       providers: [
// // //         RepositoryProvider.value(value: movieRepository),
// // //         RepositoryProvider.value(value: movieDetailsRepository),
// // //       ],
// // //       child: MultiBlocProvider(
// // //         providers: [
// // //           BlocProvider<MovieSuggestionsCubit>(
// // //             create: (context) => MovieSuggestionsCubit(movieRepository), // Initialize Cubit
// // //           ),
// // //         ],
// // //         child: MaterialApp(
// // //           debugShowCheckedModeBanner: false,
// // //           home: MovieDetailsScreen(movieId: 15),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import 'package:dio/dio.dart';
// // // // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/cc.dart';
// // // // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
// // // // // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_screen.dart';
// // // // import '../../Data/DataSources/api_service.dart';
// // // // import '../../Data/Repositories/movie_repository_impl.dart';
// // // // void main() {
// // // //   final dio = Dio();
// // // //   final apiService = ApiService(dio);
// // // //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// // // //   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);

// // // //   runApp(MyApp(
// // // //     movieRepository: movieRepository,
// // // //     movieDetailsRepository: movieDetailsRepository,
// // // //   ));
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   final MovieRepositoryImpl movieRepository;
// // // //   final MovieDetailsRepository movieDetailsRepository;
  

// // // //   MyApp({required this.movieRepository, required this.movieDetailsRepository});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MultiRepositoryProvider(
// // // //       providers: [
// // // //         RepositoryProvider.value(value: movieRepository),
// // // //         RepositoryProvider.value(value: movieDetailsRepository),
// // // //       ],
// // // //       child: MaterialApp(
// // // //         debugShowCheckedModeBanner: false,
// // // //         home:  MovieDetailsScreen(movieId: 15),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // import 'Cubit/search_cubit.dart';

// // // // // void main() {
// // // // //   final dio = Dio();
// // // // //   final apiService = ApiService(dio);

// // // // //   // Initialize Movies
// // // // //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// // // // //   final getMoviesUseCase = GetMoviesUseCase(movieRepository);
// // // // //   // final movieRepository = MovieRepositoryImpl(moviesApi);


// // // // //   // Initialize Search
// // // // //   final searchRepository = SearchRepositoryImpl(apiService: apiService);
// // // // //   final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

// // // // //   runApp(MyApp(
// // // // //     getMoviesUseCase: getMoviesUseCase,
// // // // //     searchMoviesUseCase: searchMoviesUseCase,
// // // // //   ));
// // // // // }

// // // // // class MyApp extends StatelessWidget {
// // // // //   final GetMoviesUseCase getMoviesUseCase;
// // // // //   final SearchMoviesUseCase searchMoviesUseCase;

// // // // //   MyApp({required this.getMoviesUseCase, required this.searchMoviesUseCase});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MultiBlocProvider(
// // // // //       providers: [
// // // // //         BlocProvider(
// // // // //             create: (context) => MovieCubit(getMoviesUseCase)..loadMovies()),
// // // // //         BlocProvider(
// // // // //             create: (context) =>
// // // // //                 SearchCubit(searchMoviesUseCase: searchMoviesUseCase)),
// // // // //       ],
// // // // //       child: MaterialApp(
// // // // //         debugShowCheckedModeBanner: false,
// // // // //         home: MovieDetailsScreen(movieId: 10,), //MovieListScreen  SearchScreen
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }