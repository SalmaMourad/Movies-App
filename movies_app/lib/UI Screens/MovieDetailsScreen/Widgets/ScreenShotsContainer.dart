import 'package:flutter/material.dart';

class ScreenShotsContainer extends StatelessWidget {
  const ScreenShotsContainer({
    super.key,
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
                image: AssetImage('Assets/Images/screenshotmovie1.jpg'),
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
                image: AssetImage('Assets/Images/screenshotmovie2.jpg'),
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
                image: AssetImage('Assets/Images/screenshotmovie3.jpg'),
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
