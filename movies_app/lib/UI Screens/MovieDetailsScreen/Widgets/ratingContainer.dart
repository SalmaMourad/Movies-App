
import 'package:flutter/material.dart';

class ratingLittleContainer extends StatelessWidget {
  final IconData icon;
  final String number;
  ratingLittleContainer({
    super.key,
    required this.icon,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF282A28),
      ),
      width: 111,
      height: 47,
      // color: Color(0xFF282A28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFFF6BD00),
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            number,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
