import 'package:flutter/material.dart';

class ScreenShotsContainer extends StatelessWidget {
  final String? img1;
  final String? img2;
  final String? img3;
  ScreenShotsContainer({
    super.key,
    this.img1,
    this.img2,
    this.img3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  Screen Shots',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            height: 167,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img1 ?? ""),
              ),
            ),
            child: Text(''),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            height: 167,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img2 ?? ""),
              ),
            ),
            child: Text(''),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            height: 167,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img3 ?? ""),
              ),
            ),
            child: Text(''),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
