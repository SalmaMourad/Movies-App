import 'package:flutter/material.dart';

class MovieGenere extends StatelessWidget {
  // final List<Map<String, String>> castList;

  MovieGenere(
      // {

      // required this.castList
      // }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "genere",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              // childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // itemCount: castList.length,
            itemCount: 5,
            itemBuilder: (context, index) {
              // final cast = castList[index];
              return Container(
                height: 36,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Text('action'),
              );
            },
          ),
        ],
      ),
    );
  }
}
