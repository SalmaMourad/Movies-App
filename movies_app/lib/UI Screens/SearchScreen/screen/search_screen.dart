import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
import '../Cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        // appBar: AppBar(title: Text("Search Movies")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onChanged: (query) {
                  context.read<SearchCubit>().searchMovies(query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, List<Movie>>(
                builder: (context, movies) {
                  if (movies.isEmpty || searchController == null)
                    return Center(
                      child: Image.asset('Assets/Images/EmptySearchScreen.png'),
                      // Text("No movies found")
                    );
                  // return ListView.builder(
                  //   itemCount: movies.length,
                  //   itemBuilder: (context, index) {
                  //     final movie = movies[index];
                  //     return ListTile(
                  //       // leading: Image.network(movie.largeCoverImage ?? ""),
                  //       title: Text(movie.title),
                  //       subtitle: Text(movie.description ?? ""),
                  //     );
                  //   },
                  // );
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
