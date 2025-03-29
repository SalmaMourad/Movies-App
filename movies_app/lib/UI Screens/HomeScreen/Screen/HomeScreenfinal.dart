import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
import 'package:movies_app/UI%20Screens/HomeScreen/widgets/MoviesCategoryHomeWidget.dart';
import 'package:movies_app/UI%20Screens/HomeScreen/widgets/SliderContainerCustom.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/Screen/search_screen.dart';
import 'package:movies_app/db/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    SearchScreen(),
    MovieListScreen(),
    UserProfileScreen(),
  ];
  // SearchScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex], // Show the current screen based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        type:
            BottomNavigationBarType.fixed, // Recommended for more than 3 items
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Browse",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// This contains your original home content
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieCubit = BlocProvider.of<MovieCubit>(context);
    movieCubit.loadMovies();

    return BlocBuilder<MovieCubit, List<Movie>>(
      builder: (context, movies) {
        if (movies.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        final featuredMovies = movies.take(10).toList();

        List<Movie> getMoviesByCategory(String category) {
          return movies
              .where((movie) => movie.genres?.contains(category) ?? false)
              .toList();
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderContainerCustom(featuredMovies: featuredMovies),
              MoviesCategoryHomeWidget(
                context: context,
                title: "Action",
                movies: getMoviesByCategory("Action"),
              ),
              MoviesCategoryHomeWidget(
                context: context,
                title: "Drama",
                movies: getMoviesByCategory("Drama"),
              ),
              MoviesCategoryHomeWidget(
                context: context,
                title: "Comedy",
                movies: getMoviesByCategory("Comedy"),
              ),
            ],
          ),
        );
      },
    );
  }
}
