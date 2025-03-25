import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
import 'movie_cubit.dart';
// import 'movie_response.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: BlocBuilder<MovieCubit, List<Movie>>(
        builder: (context, movies) {
          if (movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return InkWell(
                onTap: () {
                  // tro7 ll movie details b3den
                },
                child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                    height: 279,
                    width: 189,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              movie.background_image ??
                                  "https://example.com/default-image.jpg",
                              // errorBuilder: (context, error, stackTrace) {
                              //   return Icon(Icons.image_not_supported);
                              // },
                            )
                            //  Image.network(
                            //     movie.background_image ??
                            //         "https://example.com/default-image.jpg",
                            //     errorBuilder: (context, error, stackTrace) {
                            //       return Icon(Icons.image_not_supported);
                            //     },
                            //   ),
                            // AssetImage(movieImagePath)
                            )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 15),
                          height: 28,
                          width: 58,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 51, 56, 51),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${movie.rating}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
             
            },
          );
        },
      ),
    );
  }
}
