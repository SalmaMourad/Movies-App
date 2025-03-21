
import 'package:flutter/material.dart';

import 'ratingContainer.dart';

class RatingsAllContainers extends StatelessWidget {
  const RatingsAllContainers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ratingLittleContainer(
          icon: Icons.favorite,
          number: '7.8',
        ),
        ratingLittleContainer(
          icon: Icons.watch_later,
          number: '90',
        ),
        ratingLittleContainer(
          icon: Icons.star,
          number: '75',
        ),
      ],
    );
  }
}
