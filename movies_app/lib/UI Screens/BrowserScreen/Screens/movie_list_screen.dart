import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
// import '../../../oldCode/ANewfortest/movie_list_screen copy.dart';
import '../Cubit/movie_cubit.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    "All",
    "Action",
    "Drama",
    "Comedy",
    "Horror"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            SizedBox(
              height: 52,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                      BlocProvider.of<MovieCubit>(context).loadMovies(
                          genre: categories[index] == "All"
                              ? null
                              : categories[index]);
                    },
                    child: CategoryTab(
                        title: categories[index],
                        isSelected: index == selectedCategoryIndex),
                  );
                },
              ),
            ),

            // Movie List
            Expanded(
              child: BlocBuilder<MovieCubit, List<Movie>>(
                builder: (context, movies) {
                  if (movies.isEmpty)
                    return Center(child: CircularProgressIndicator());
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return MovieCard(
                          movieName: movie.title,
                          movieImagePath: movie.largeCoverImage ??
                              "https://example.com/default-image.jpg",
                          movieRating: movie.rating?.toString() ?? "N/A",
                        );
                      },
                    ),
                  );

                  // return ListView.builder(
                  //   itemCount: movies.length,
                  //   itemBuilder: (context, index) {
                  //     final movie = movies[index];
                  //     return ListTile(
                  //       leading: Image.network(movie.largeCoverImage ?? ""),//large_cover_image
                  //       title: Text(movie.title, style: TextStyle(color: Colors.white)),
                  //       subtitle: Text("⭐ ${movie.rating?.toString() ?? "N/A"}", style: TextStyle(color: Colors.amber)),
                  //     );
                  //   },
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );

    
  }
  
}


class CategoryTab extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryTab({required this.title, this.isSelected = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 10,bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieImagePath;
  final String movieRating;
  final String movieName;


  const MovieCard({required this.movieImagePath, required this.movieRating, Key? key, required this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 279,
      width: 189,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(movieImagePath),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 15),
            height: 28,
            width: 58,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 51, 56, 51),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$movieRating",
                  style: const TextStyle(color: Colors.white),
                ),
                //  Text(
                //   "$movieName",
                //   style: const TextStyle(color: Colors.white),
                // ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CategoryTab extends StatelessWidget {
//   final String title;
//   final bool isSelected;

//   const CategoryTab({required this.title, this.isSelected = false, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48,
//       margin: const EdgeInsets.only(left: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.amber : Colors.black,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.amber, width: 2),
//       ),
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: isSelected ? Colors.black : Colors.amber,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final String movieImagePath;
//   final String movieRating;
//   final String movieName;


//   const MovieCard({required this.movieImagePath, required this.movieRating, Key? key, required this.movieName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 279,
//       width: 189,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(movieImagePath),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(left: 10, top: 15),
//             height: 28,
//             width: 58,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 51, 56, 51),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "$movieRating ,$movieName",
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                   size: 18,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }