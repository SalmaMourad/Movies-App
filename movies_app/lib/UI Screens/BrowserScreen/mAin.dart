import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/Screen/search_screen.dart';
import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
import 'package:movies_app/MovieDetailsScreennnn/cubit/MovieSuggestionsCubit.dart';
import 'package:movies_app/Data/Repositories/movie_details_repository.dart';
import 'package:movies_app/Data/Repositories/MovieSuggestionsRepository.dart';
import 'package:movies_app/Data/DataSources/api_service.dart';
import 'package:movies_app/Data/Repositories/movie_repository_impl.dart';
import 'package:movies_app/Data/Repositories/search_repository_implm.dart';
import 'package:movies_app/Domain/UseCases/get_movies_usecase.dart';
import 'package:movies_app/Domain/UseCases/search_movies_usecase.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/Cubit/search_cubit.dart';
import 'package:movies_app/UI%20Screens/HomeScreen/Screen/HomeScreenfinal.dart';
// import 'package:movies_app/UI%20Screens/home/h3.dart'; // Make sure this import points to your HomeScreen file

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);

  // Initialize repositories
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final searchRepository = SearchRepositoryImpl(apiService: apiService);
  final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
  final movieSuggestionsRepository = MovieSuggestionsRepository(apiService: apiService);

  // Initialize use cases
  final getMoviesUseCase = GetMoviesUseCase(movieRepository);
  final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

  runApp(MyApp(
    getMoviesUseCase: getMoviesUseCase,
    searchMoviesUseCase: searchMoviesUseCase,
    movieDetailsRepository: movieDetailsRepository,
    movieSuggestionsRepository: movieSuggestionsRepository,
  ));
}

class MyApp extends StatelessWidget {
  final GetMoviesUseCase getMoviesUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;
  final MovieDetailsRepository movieDetailsRepository;
  final MovieSuggestionsRepository movieSuggestionsRepository;

  MyApp({
    required this.getMoviesUseCase,
    required this.searchMoviesUseCase,
    required this.movieDetailsRepository,
    required this.movieSuggestionsRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: movieDetailsRepository),
        RepositoryProvider.value(value: movieSuggestionsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MovieCubit(getMoviesUseCase)..loadMovies(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(searchMoviesUseCase: searchMoviesUseCase),
          ),
          BlocProvider(
            create: (context) => MovieSuggestionsCubit(
              repository: movieSuggestionsRepository,
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // Set HomeScreen as the initial route
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(), // Changed from MovieListScreen to HomeScreen
            '/browse': (context) => MovieListScreen(), // Added route for browsing
            '/search': (context) => SearchScreen(),
            '/details': (context) => MovieDetailsScreen(movieId: 15), // You can pass dynamic ID
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
// import 'package:movies_app/UI%20Screens/SearchScreen/Screen/search_screen.dart';
// import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
// import 'package:movies_app/MovieDetailsScreennnn/cubit/MovieSuggestionsCubit.dart';
// import 'package:movies_app/Data/Repositories/movie_details_repository.dart';
// import 'package:movies_app/Data/Repositories/MovieSuggestionsRepository.dart';
// import 'package:movies_app/Data/DataSources/api_service.dart';
// import 'package:movies_app/Data/Repositories/movie_repository_impl.dart';
// import 'package:movies_app/Data/Repositories/search_repository_implm.dart';
// import 'package:movies_app/Domain/UseCases/get_movies_usecase.dart';
// import 'package:movies_app/Domain/UseCases/search_movies_usecase.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
// import 'package:movies_app/UI%20Screens/SearchScreen/Cubit/search_cubit.dart';
// import 'package:movies_app/UI%20Screens/home/h.dart';

// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio);

//   // Initialize repositories
//   final movieRepository = MovieRepositoryImpl(apiService: apiService);
//   final searchRepository = SearchRepositoryImpl(apiService: apiService);
//   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
//   final movieSuggestionsRepository = MovieSuggestionsRepository(apiService: apiService);

//   // Initialize use cases
//   final getMoviesUseCase = GetMoviesUseCase(movieRepository);
//   final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

//   runApp(MyApp(
//     getMoviesUseCase: getMoviesUseCase,
//     searchMoviesUseCase: searchMoviesUseCase,
//     movieDetailsRepository: movieDetailsRepository,
//     movieSuggestionsRepository: movieSuggestionsRepository,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final GetMoviesUseCase getMoviesUseCase;
//   final SearchMoviesUseCase searchMoviesUseCase;
//   final MovieDetailsRepository movieDetailsRepository;
//   final MovieSuggestionsRepository movieSuggestionsRepository;

//   MyApp({
//     required this.getMoviesUseCase,
//     required this.searchMoviesUseCase,
//     required this.movieDetailsRepository,
//     required this.movieSuggestionsRepository,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider.value(value: movieDetailsRepository),
//         RepositoryProvider.value(value: movieSuggestionsRepository),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => MovieCubit(getMoviesUseCase)..loadMovies(),
//           ),
//           BlocProvider(
//             create: (context) => SearchCubit(searchMoviesUseCase: searchMoviesUseCase),
//           ),
//           BlocProvider(
//             create: (context) => MovieSuggestionsCubit(
//               repository: movieSuggestionsRepository,
//             ),
//           ),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           // home: HomeScreen(),
//           initialRoute: '/',
//           routes: {
//             '/': (context) => MovieListScreen(),
//             '/search': (context) => SearchScreen(),
//             '/details': (context) => MovieDetailsScreen(movieId: 15), // You can pass dynamic ID
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:movies_app/MovieDetailsScreennnn/movie_details_screen.dart';
// import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsCubit.dart';
// // import 'package:movies_app/MovieSuggestionsStuff/MovieDetailsScreenFinal.dart';
// import 'package:movies_app/MovieDetailsScreennnn/movie_details_repository.dart';
// // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_screen.dart';
// import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsRepository.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
// import '../../Data/DataSources/api_service.dart';
// import '../../Data/Repositories/movie_repository_impl.dart';

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
//         home: BlocProvider(
//           create: (context) => MovieSuggestionsCubit(
//             repository: context.read<MovieSuggestionsRepository>(),
//           ),
//           // child: MovieListScreen(),
//           child: MovieDetailsScreen(movieId: 20),
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
// // import 'package:movies_app/ammmmmmmmmmm/repo.dart';
// // import 'package:movies_app/ammmmmmmmmmm/s.dart';
// // import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
// // import 'package:movies_app/aaaaaaaaaaaaaaaaaaaaaaa/cc.dart';
// // import '../../Data/DataSources/api_service.dart';
// // import '../../Data/Repositories/movie_repository_impl.dart';
// // // import '../../Presentation/Blocs/movie_suggestions_cubit.dart';

// // // main.dart
// // void main() {
// //   final dio = Dio();
// //   final apiService = ApiService(dio);
// //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// //   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
// //   final movieSuggestionsRepository = MovieSuggestionsRepository(apiService: apiService);

// //   runApp(MyApp(
// //     movieRepository: movieRepository,
// //     movieDetailsRepository: movieDetailsRepository,
// //     movieSuggestionsRepository: movieSuggestionsRepository,
// //   ));
// // }

// // class MyApp extends StatelessWidget {
// //   final MovieRepositoryImpl movieRepository;
// //   final MovieDetailsRepository movieDetailsRepository;
// //   final MovieSuggestionsRepository movieSuggestionsRepository;

// //   MyApp({
// //     required this.movieRepository,
// //     required this.movieDetailsRepository,
// //     required this.movieSuggestionsRepository,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiRepositoryProvider(
// //       providers: [
// //         RepositoryProvider.value(value: movieRepository),
// //         RepositoryProvider.value(value: movieDetailsRepository),
// //         RepositoryProvider.value(value: movieSuggestionsRepository),
// //       ],
// //       child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         home: MovieDetailsScreen(movieId: 15),
// //       ),
// //     );
// //   }
// // }
// // In your main.dart or wherever you create the MovieDetailsScreen

// // void main() {
// //   final dio = Dio();
// //   final apiService = ApiService(dio);
// //   final movieRepository = MovieRepositoryImpl(apiService: apiService);
// //   final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
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
// //             create: (context) => MovieSuggestionsCubit(getMovieSuggestionsUseCase), // ✅ Fix: Wrap inside MultiBlocProvider
// //           ),
// //         ],
// //         child: MaterialApp(
// //           debugShowCheckedModeBanner: false,
// //           home: MovieDetailsScreen(movieId: 1), // ✅ Make sure this screen needs the provider
// //         ),
// //       ),
// //     );
// //   }
// // }
