
import 'package:flutter/material.dart';

class genereContainer extends StatelessWidget {
  final String? genre;
  genereContainer({
    super.key,
    this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff282A28),
      ),
      child: Center(
          child: Text(
        genre ?? "",
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
