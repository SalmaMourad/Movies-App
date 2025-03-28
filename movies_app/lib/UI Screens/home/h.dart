import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto-scroll the page view
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieCubit = BlocProvider.of<MovieCubit>(context);
    movieCubit.loadMovies();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Movies App'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<MovieCubit, List<Movie>>(
        builder: (context, movies) {
          if (movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          final featuredMovies = movies.take(5).toList();

          List<Movie> getMoviesByCategory(String category) {
            return movies
                .where((movie) => movie.genres?.contains(category) ?? false)
                .toList();
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured Movies - Custom Carousel with PageView
                SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: featuredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = featuredMovies[index];
                          return Container(
                            // padding:EdgeInsets.all(8) ,
                            height: 645,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black
                                        .withOpacity(0.4), // Dark fade on top
                                    Colors.black.withOpacity(
                                        1), // Transparent at the bottom
                                  ],
                                ),
                                // ),
                                // decoration: BoxDecoration(
                                // gradient: LinearGradient(colors: [
                                // Colors.black,
                                // Colors.black,
                                // ]),
                                // color: Colors.red,
                                image: DecorationImage(
                                    opacity: 0.2,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        movie.largeCoverImage ?? ""))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('Assets/Images/Available Now.png',width: 220,),
                                //   Text(
                                //   'Available Now',
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 32,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailsScreen(
                                                movieId: movie.id),
                                      ),
                                    );
                                  },
                                  child: AnimatedBuilder(
                                    animation: _pageController,
                                    builder: (context, child) {
                                      double value = 1.0;
                                      if (_pageController
                                          .position.haveDimensions) {
                                        value = _pageController.page! - index;
                                        value = (1 - (value.abs() * 0.3))
                                            .clamp(0.0, 1.0);
                                      }
                                      return Center(
                                        child: SizedBox(
                                          height:
                                              Curves.easeOut.transform(value) *
                                                  345,
                                          width:
                                              Curves.easeOut.transform(value) *
                                                  224,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 351,
                                      width: 234,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        image: DecorationImage(
                                          image: NetworkImage(movie
                                                  .largeCoverImage ??
                                              "https://example.com/default-image.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 16),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    movie.rating
                                                            ?.toStringAsFixed(
                                                                1) ??
                                                        "N/A",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset('Assets/Images/Watch Now.png',width: 220,),

                                // Text(
                                //   'Watch Now',
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 32,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            featuredMovies.length,
                            (index) => Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? Colors.amber
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Rest of your existing category sections...
                _buildCategorySection(
                  context: context,
                  title: "Action Movies",
                  movies: getMoviesByCategory("Action"),
                  onViewAll: () => _navigateToCategory(context, "Action"),
                ),

                _buildCategorySection(
                  context: context,
                  title: "Drama Movies",
                  movies: getMoviesByCategory("Drama"),
                  onViewAll: () => _navigateToCategory(context, "Drama"),
                ),

                _buildCategorySection(
                  context: context,
                  title: "Comedy Movies",
                  movies: getMoviesByCategory("Comedy"),
                  onViewAll: () => _navigateToCategory(context, "Comedy"),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // Keep your existing _buildCategorySection and _navigateToCategory methods...
  Widget _buildCategorySection({
    required BuildContext context,
    required String title,
    required List<Movie> movies,
    required VoidCallback onViewAll,
  }) {
    if (movies.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onViewAll,
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: movies.length > 5 ? 5 : movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsScreen(movieId: movie.id),
                    ),
                  );
                },
                child: Container(
                  width: 120,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(movie.largeCoverImage ??
                          "https://example.com/default-image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 14),
                              SizedBox(width: 2),
                              Text(
                                movie.rating?.toStringAsFixed(1) ?? "N/A",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieListScreen(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/Domain/Models/movie.dart';
// import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
// import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:flutter/material.dart' hide CarouselController;


// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Load movies when the screen is built
//     final movieCubit = BlocProvider.of<MovieCubit>(context);
//     movieCubit.loadMovies();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Movies App'),
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: BlocBuilder<MovieCubit, List<Movie>>(
//         builder: (context, movies) {
//           if (movies.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }
          
//           // Get first 5 movies (assuming they're already sorted by highest rating)
//           final featuredMovies = movies.take(5).toList();

//           // Filter movies by category
//           List<Movie> getMoviesByCategory(String category) {
//             return movies.where((movie) => movie.genres?.contains(category) ?? false).toList();
//           }

//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Featured Movies Slider
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//                   child: CarouselSlider(
//                     options: CarouselOptions(
//                       height: 250,
//                       autoPlay: true,
//                       enlargeCenterPage: true,
//                       viewportFraction: 0.8,
//                     ),
//                     items: featuredMovies.map((movie) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MovieDetailsScreen(movieId: movie.id),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             image: DecorationImage(
//                               image: NetworkImage(movie.largeCoverImage ??
//                                   "https://example.com/default-image.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 bottom: 10,
//                                 left: 10,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 8, vertical: 4),
//                                   decoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.7),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.star,
//                                           color: Colors.yellow, size: 16),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         movie.rating?.toStringAsFixed(1) ??
//                                             "N/A",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),

//                 // Category Sections
//                 _buildCategorySection(
//                   context: context,
//                   title: "Action Movies",
//                   movies: getMoviesByCategory("Action"),
//                   onViewAll: () => _navigateToCategory(context, "Action"),
//                 ),
                
//                 _buildCategorySection(
//                   context: context,
//                   title: "Drama Movies",
//                   movies: getMoviesByCategory("Drama"),
//                   onViewAll: () => _navigateToCategory(context, "Drama"),
//                 ),
                
//                 _buildCategorySection(
//                   context: context,
//                   title: "Comedy Movies",
//                   movies: getMoviesByCategory("Comedy"),
//                   onViewAll: () => _navigateToCategory(context, "Comedy"),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white54,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategorySection({
//     required BuildContext context,
//     required String title,
//     required List<Movie> movies,
//     required VoidCallback onViewAll,
//   }) {
//     if (movies.isEmpty) return SizedBox();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: onViewAll,
//                 child: Text(
//                   "View All",
//                   style: TextStyle(color: Colors.amber),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 180,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             itemCount: movies.length > 5 ? 5 : movies.length,
//             itemBuilder: (context, index) {
//               final movie = movies[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MovieDetailsScreen(movieId: movie.id),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 120,
//                   margin: EdgeInsets.symmetric(horizontal: 8.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: NetworkImage(movie.largeCoverImage ??
//                           "https://example.com/default-image.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         bottom: 5,
//                         left: 5,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 6, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.7),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.star, color: Colors.yellow, size: 14),
//                               SizedBox(width: 2),
//                               Text(
//                                 movie.rating?.toStringAsFixed(1) ?? "N/A",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }

//   void _navigateToCategory(BuildContext context, String category) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MovieListScreen(),
//       ),
//     );
//   }
// }
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:movies_app/Domain/Models/movie.dart';
// // import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
// // import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
// // import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
// // // import '../Cubit/movie_cubit.dart';
// // // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
// // import 'package:carousel_slider/carousel_controller.dart' as carousel_slider;

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Load movies when the screen is built
// //     final movieCubit = BlocProvider.of<MovieCubit>(context);
// //     movieCubit.loadMovies();

// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         title: Text('Movies App'),
// //         backgroundColor: Colors.black,
// //         elevation: 0,
// //       ),
// //       body: BlocBuilder<MovieCubit, List<Movie>>(
// //         builder: (context, movies) {
// //           if (movies.isEmpty) {
// //             return Center(child: CircularProgressIndicator());
// //           }
          
// //           // Get top 5 highest rated movies for the slider
// //           // final featuredMovies = movies
// //           //   ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0))
// //           //   .take(5)
// //           //   .toList();
// //             // Get first 5 movies (assuming they're already sorted by highest rating)
// // final featuredMovies = movies.take(5).toList();

// //           // Filter movies by category
// //           List<Movie> getMoviesByCategory(String category) {
// //             return movies.where((movie) => movie.genres?.contains(category) ?? false).toList();
// //           }

// //           return SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Featured Movies Slider
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
// //                   child: CarouselSlider(
// //                     options: CarouselOptions(
// //                       height: 250,
// //                       autoPlay: true,
// //                       enlargeCenterPage: true,
// //                       viewportFraction: 0.8,
// //                     ),
// //                     items: featuredMovies.map((movie) {
// //                       return Builder(
// //                         builder: (BuildContext context) {
// //                           return GestureDetector(
// //                             onTap: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => MovieDetailsScreen(movieId: movie.id),
// //                                 ),
// //                               );
// //                             },
// //                             child: Container(
// //                               width: MediaQuery.of(context).size.width,
// //                               margin: EdgeInsets.symmetric(horizontal: 5.0),
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(15),
// //                                 image: DecorationImage(
// //                                   image: NetworkImage(movie.largeCoverImage ??
// //                                       "https://example.com/default-image.jpg"),
// //                                   fit: BoxFit.cover,
// //                                 ),
// //                               ),
// //                               child: Stack(
// //                                 children: [
// //                                   Positioned(
// //                                     bottom: 10,
// //                                     left: 10,
// //                                     child: Container(
// //                                       padding: EdgeInsets.symmetric(
// //                                           horizontal: 8, vertical: 4),
// //                                       decoration: BoxDecoration(
// //                                         color: Colors.black.withOpacity(0.7),
// //                                         borderRadius: BorderRadius.circular(10),
// //                                       ),
// //                                       child: Row(
// //                                         children: [
// //                                           Icon(Icons.star,
// //                                               color: Colors.yellow, size: 16),
// //                                           SizedBox(width: 4),
// //                                           Text(
// //                                             movie.rating?.toStringAsFixed(1) ??
// //                                                 "N/A",
// //                                             style: TextStyle(
// //                                                 color: Colors.white,
// //                                                 fontWeight: FontWeight.bold),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     }).toList(),
// //                   ),
// //                 ),

// //                 // Category Sections
// //                 _buildCategorySection(
// //                   context: context,
// //                   title: "Action Movies",
// //                   movies: getMoviesByCategory("Action"),
// //                   onViewAll: () => _navigateToCategory(context, "Action"),
// //                 ),
                
// //                 _buildCategorySection(
// //                   context: context,
// //                   title: "Drama Movies",
// //                   movies: getMoviesByCategory("Drama"),
// //                   onViewAll: () => _navigateToCategory(context, "Drama"),
// //                 ),
                
// //                 _buildCategorySection(
// //                   context: context,
// //                   title: "Comedy Movies",
// //                   movies: getMoviesByCategory("Comedy"),
// //                   onViewAll: () => _navigateToCategory(context, "Comedy"),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.black,
// //         selectedItemColor: Colors.yellow,
// //         unselectedItemColor: Colors.white54,
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildCategorySection({
// //     required BuildContext context,
// //     required String title,
// //     required List<Movie> movies,
// //     required VoidCallback onViewAll,
// //   }) {
// //     if (movies.isEmpty) return SizedBox(); // Don't show empty sections

// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 title,
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 22,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               TextButton(
// //                 onPressed: onViewAll,
// //                 child: Text(
// //                   "View All",
// //                   style: TextStyle(color: Colors.amber),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(
// //           height: 180,
// //           child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             padding: EdgeInsets.symmetric(horizontal: 8.0),
// //             itemCount: movies.length > 5 ? 5 : movies.length,
// //             itemBuilder: (context, index) {
// //               final movie = movies[index];
// //               return GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => MovieDetailsScreen(movieId: movie.id),
// //                     ),
// //                   );
// //                 },
// //                 child: Container(
// //                   width: 120,
// //                   margin: EdgeInsets.symmetric(horizontal: 8.0),
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(10),
// //                     image: DecorationImage(
// //                       image: NetworkImage(movie.largeCoverImage ??
// //                           "https://example.com/default-image.jpg"),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                   child: Stack(
// //                     children: [
// //                       Positioned(
// //                         bottom: 5,
// //                         left: 5,
// //                         child: Container(
// //                           padding: EdgeInsets.symmetric(
// //                               horizontal: 6, vertical: 3),
// //                           decoration: BoxDecoration(
// //                             color: Colors.black.withOpacity(0.7),
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           child: Row(
// //                             children: [
// //                               Icon(Icons.star, color: Colors.yellow, size: 14),
// //                               SizedBox(width: 2),
// //                               Text(
// //                                 movie.rating?.toStringAsFixed(1) ?? "N/A",
// //                                 style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           ),
// //         ),
// //         SizedBox(height: 16),
// //       ],
// //     );
// //   }

// //   void _navigateToCategory(BuildContext context, String category) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => MovieListScreen(),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:movies_app/Domain/Models/movie.dart';
// // import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
// // import 'package:movies_app/UI%20Screens/BrowserScreen/Cubit/movie_cubit.dart';
// // // import '../Cubit/movie_cubit.dart';

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Load movies when the screen is built
// //     final movieCubit = BlocProvider.of<MovieCubit>(context);
// //     movieCubit.loadMovies();

// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         title: Text('Movies App'),
// //         backgroundColor: Colors.black,
// //         elevation: 0,
// //       ),
// //       body: BlocBuilder<MovieCubit, List<Movie>>(
// //         builder: (context, movies) {
// //           if (movies.isEmpty) {
// //             return Center(child: CircularProgressIndicator());
// //           }
          
// //           return SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Featured Movies Section
// //                 Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Text(
// //                     "Available Now",
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   height: 250,
// //                   child: ListView.builder(
// //                     scrollDirection: Axis.horizontal,
// //                     itemCount: movies.length > 5 ? 5 : movies.length,
// //                     itemBuilder: (context, index) {
// //                       final movie = movies[index];
// //                       return GestureDetector(
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   MovieDetailsScreen(movieId: movie.id),
// //                             ),
// //                           );
// //                         },
// //                         child: Container(
// //                           width: 150,
// //                           margin: EdgeInsets.symmetric(horizontal: 10),
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(12),
// //                             image: DecorationImage(
// //                               image: NetworkImage(movie.largeCoverImage ??
// //                                   "https://example.com/default-image.jpg"),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                           child: Stack(
// //                             children: [
// //                               Positioned(
// //                                 top: 10,
// //                                 left: 10,
// //                                 child: Container(
// //                                   padding: EdgeInsets.symmetric(
// //                                       horizontal: 8, vertical: 4),
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.black.withOpacity(0.7),
// //                                     borderRadius: BorderRadius.circular(10),
// //                                   ),
// //                                   child: Row(
// //                                     children: [
// //                                       Icon(Icons.star,
// //                                           color: Colors.yellow, size: 16),
// //                                       SizedBox(width: 4),
// //                                       Text(
// //                                         movie.rating?.toStringAsFixed(1) ??
// //                                             "N/A",
// //                                         style: TextStyle(
// //                                             color: Colors.white,
// //                                             fontWeight: FontWeight.bold),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
                
// //                 // Popular Movies Section
// //                 Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Text(
// //                     "Popular Movies",
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 26,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                   child: GridView.builder(
// //                     shrinkWrap: true,
// //                     physics: NeverScrollableScrollPhysics(),
// //                     gridDelegate:
// //                         const SliverGridDelegateWithFixedCrossAxisCount(
// //                       crossAxisCount: 2,
// //                       crossAxisSpacing: 15,
// //                       mainAxisSpacing: 15,
// //                       childAspectRatio: 0.7,
// //                     ),
// //                     itemCount: movies.length > 10 ? 10 : movies.length,
// //                     itemBuilder: (context, index) {
// //                       final movie = movies[index];
// //                       return InkWell(
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   MovieDetailsScreen(movieId: movie.id),
// //                             ),
// //                           );
// //                         },
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(20),
// //                             color: Colors.white,
// //                             image: DecorationImage(
// //                               fit: BoxFit.cover,
// //                               image: NetworkImage(movie.largeCoverImage ??
// //                                   "https://example.com/default-image.jpg"),
// //                             ),
// //                           ),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Container(
// //                                 margin: const EdgeInsets.only(left: 10, top: 15),
// //                                 height: 28,
// //                                 width: 58,
// //                                 decoration: BoxDecoration(
// //                                   color: const Color.fromARGB(255, 51, 56, 51),
// //                                   borderRadius: BorderRadius.circular(10),
// //                                 ),
// //                                 child: Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Text(
// //                                       movie.rating?.toStringAsFixed(1) ?? "N/A",
// //                                       style: const TextStyle(color: Colors.white),
// //                                     ),
// //                                     const Icon(
// //                                       Icons.star,
// //                                       color: Colors.amber,
// //                                       size: 18,
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.black,
// //         selectedItemColor: Colors.yellow,
// //         unselectedItemColor: Colors.white54,
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
// //           BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
// //         ],
// //       ),
// //     );
// //   }
// // }