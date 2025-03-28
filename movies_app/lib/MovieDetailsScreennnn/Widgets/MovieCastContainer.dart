import 'package:flutter/material.dart';

class MovieCastContainer extends StatelessWidget {
  final List<Map<String, String>> castList;

  MovieCastContainer({required this.castList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: castList.length,
            itemBuilder: (context, index) {
              final cast = castList[index];
              return Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'Assets/Images/screenshotmoviePoster.jpeg',
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  title: Text(
                    "Name: ${cast['name']}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Character: ${cast['character']}",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
