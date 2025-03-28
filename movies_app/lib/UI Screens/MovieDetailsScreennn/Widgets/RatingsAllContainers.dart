import 'package:flutter/material.dart';

import 'ratingContainer.dart';

class RatingsAllContainers extends StatelessWidget {
  final double? rating;
  final double? runtime;
  final double? like_count;
  RatingsAllContainers({
    super.key,
    required this.rating,
    required this.runtime,
    required this.like_count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ratingLittleContainer(
          icon: Icons.favorite,
          number: "$like_count",
        ),
        ratingLittleContainer(
          icon: Icons.watch_later,
          number: '$runtime',
        ),
        ratingLittleContainer(
          icon: Icons.star,
          number: '$rating',
        ),
      ],
    );
  }
}
