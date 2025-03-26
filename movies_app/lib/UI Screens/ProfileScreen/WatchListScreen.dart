import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WatchListScreen(),
    );
  }
}

class WatchListScreen extends StatelessWidget {
  // 
  final List<Map<String, String>> movies = [
    {"image": "assets/black_widow.jpg", "rating": "7.7"},
    {"image": "assets/no_time_to_die.jpg", "rating": "7.7"},
    {"image": "assets/1917.jpg", "rating": "7.7"},
    {"image": "assets/avengers.jpg", "rating": "7.7"},
    {"image": "assets/black_widow2.jpg", "rating": "7.7"},
    {"image": "assets/inception.jpg", "rating": "7.7"},
    {"image": "assets/joker.jpg", "rating": "7.7"},
    {"image": "assets/doctor_strange.jpg", "rating": "7.7"},
    {"image": "assets/interstellar.jpg", "rating": "7.7"},
    {"image": "assets/aquaman.jpg", "rating": "7.7"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //  (Watch List & History)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.menu, color: Colors.yellow, size: 24),
                    Text("Watch List", style: TextStyle(color: Colors.yellow, fontSize: 14)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.folder, color: Colors.grey, size: 24),
                    Text("History", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.yellow, thickness: 2, height: 1),
          
          //  GridView
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 
                  childAspectRatio: 0.7, // 
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                    imagePath: movies[index]["image"]!,
                    rating: movies[index]["rating"]!,
                  );
                },
              ),
            ),
          ),
          
          //
          BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.yellow,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
          ),
        ],
      ),
    );
  }
}

//  GridView
class MovieItem extends StatelessWidget {
  final String imagePath;
  final String rating;

  const MovieItem({required this.imagePath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        ),
       
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(rating, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(width: 2),
                Icon(Icons.star, color: Colors.black, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
