import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

// Authentication Screens
import 'package:movies_app/db/Login/Login.dart';
import 'package:movies_app/db/Login/home.dart';
import 'package:movies_app/db/OnBoarding/onBoarding.dart';
import 'package:movies_app/db/Register/register.dart';
import 'package:movies_app/db/Splash%20Screen/splash.dart';
import 'package:movies_app/db/UpradeProfile/upgrade_profile.dart';
import 'package:movies_app/db/forget%20password/forget_password.dart';
import 'package:movies_app/db/profile/profile_screen.dart';
import 'package:movies_app/db/firebase_options.dart';
import 'package:movies_app/db/provider/auth_provider.dart';

// Movie Screens
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Dio for movie API
  final dio = Dio();
  final apiService = ApiService(dio);

  // Initialize repositories
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final searchRepository = SearchRepositoryImpl(apiService: apiService);
  final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);
  final movieSuggestionsRepository =
      MovieSuggestionsRepository(apiService: apiService);

  // Initialize use cases
  final getMoviesUseCase = GetMoviesUseCase(movieRepository);
  final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        RepositoryProvider.value(value: movieDetailsRepository),
        RepositoryProvider.value(value: movieSuggestionsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MovieCubit(getMoviesUseCase)..loadMovies(),
          ),
          BlocProvider(
            create: (context) =>
                SearchCubit(searchMoviesUseCase: searchMoviesUseCase),
          ),
          BlocProvider(
            create: (context) => MovieSuggestionsCubit(
              repository: movieSuggestionsRepository,
            ),
          ),
        ],
        child: const MoviesApp(),
      ),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: const Color(0xffFFBB3B),
        colorScheme: const ColorScheme.light(
          primary: Color(0xffFFBB3B),
          secondary: Colors.white,
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        // Authentication routes
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        UserProfileScreen.routeName: (context) => UserProfileScreen(),

        // Movie routes
        '/home': (context) => HomeScreen(),
        '/browse': (context) => MovieListScreen(),
        '/search': (context) => SearchScreen(),
        '/details': (context) =>
            MovieDetailsScreen(movieId: 15), // You can pass dynamic ID
      },
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
// import 'package:movies_app/UI%20Screens/HomeScreen/Screen/HomeScreenfinal.dart';
// // import 'package:movies_app/UI%20Screens/home/h3.dart'; // Make sure this import points to your HomeScreen file

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
//           // Set HomeScreen as the initial route
//           initialRoute: '/',
//           routes: {
//             '/': (context) => HomeScreen(), // Changed from MovieListScreen to HomeScreen
//             '/browse': (context) => MovieListScreen(), // Added route for browsing
//             '/search': (context) => SearchScreen(),
//             '/details': (context) => MovieDetailsScreen(movieId: 15), // You can pass dynamic ID
//           },
//         ),
//       ),
//     );
//   }
// }
