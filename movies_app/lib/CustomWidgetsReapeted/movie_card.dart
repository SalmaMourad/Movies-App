import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String movieRating;
  final String movieImagePath;

  MovieCard({
    super.key,
    required this.movieRating,
    required this.movieImagePath,
  });

  @override
  Widget build(BuildContext context) {
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
                  fit: BoxFit.cover, image: AssetImage(movieImagePath))),
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
                      movieRating,
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
  }
}
