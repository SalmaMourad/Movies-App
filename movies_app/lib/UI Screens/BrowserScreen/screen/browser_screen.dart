import 'package:flutter/material.dart';
import 'package:movies_app/CustomWidgetsReapeted/MoviesGrid.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/widgets/category_tab.dart';

class BrowserScreen extends StatefulWidget {
  //34an test llsearch screen
static List<Map<String, String>> movies = [
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/IronManPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/images/IronManPoster.jpg", "rating": "8.2", "name": "Iron Man", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.9", "name": "Widow Again", "category": "Adventure"},
    {"image": "Assets/images/IronManPoster.jpg", "rating": "8.3", "name": "Iron Man 2", "category": "Adventure"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.1", "name": "Funny Widow", "category": "Comedy"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.6", "name": "Comedy Action", "category": "Comedy"},
  ];
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  int selectedCategoryIndex = 0;

  List<String> categories = ["Action", "Adventure", "Comedy"];
  //34an test llbrowse screen

 static List<Map<String, String>> movies = [
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/IronManPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2", "name": "Black Widow", "category": "Action"},
    {"image": "Assets/images/IronManPoster.jpg", "rating": "8.2", "name": "Iron Man", "category": "Action"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.9", "name": "Widow Again", "category": "Adventure"},
    {"image": "Assets/images/IronManPoster.jpg", "rating": "8.3", "name": "Iron Man 2", "category": "Adventure"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.1", "name": "Funny Widow", "category": "Comedy"},
    {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.6", "name": "Comedy Action", "category": "Comedy"},
  ];

  @override
  Widget build(BuildContext context) {
    //ntl3 lmovie 3ala 7sb anhi category selected
    List<Map<String, String>> filteredMovies =
        movies.where((movie) => movie["category"] == categories[selectedCategoryIndex]).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            SizedBox(
              height: 52,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: CategoryTab(
                      title: categories[index],
                      isSelected: index == selectedCategoryIndex,
                    ),
                  );
                },
              ),
            ),
            // Movies Grid
            MoviesGrid(movies: filteredMovies),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:movies_app/CustomWidgetsReapeted/MoviesGrid.dart';
// import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/widgets/category_tab.dart';

// class BrowserScreen extends StatefulWidget {
//   @override
//   _BrowserScreenState createState() => _BrowserScreenState();
// }

// class _BrowserScreenState extends State<BrowserScreen> {
//   int selectedCategoryIndex = 0; //selected category
//   //dummy categories 34an 23ml test ll ui
//   List<String> categories = ["Action", "Adventure", "Comedy"];
//   //dummy movies l kol category 34an 23ml test
//   Map<String, List<Map<String, String>>> moviesByCategory = {
//     "Action": [
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2"},
//       {"image": "Assets/images/IronManPoster.jpg", "rating": "8.2"},
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2"},
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.2"},
//       {"image": "Assets/images/IronManPoster.jpg", "rating": "7.5"},
//     ],
//     "Adventure": [
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.9"},
//       {"image": "Assets/images/IronManPoster.jpg", "rating": "8.3"},
//     ],
//     "Comedy": [
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "8.1"},
//       {"image": "Assets/Images/blackWidowPoster.jpg", "rating": "7.6"},
//     ]
//   };

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(),
//         backgroundColor: Colors.black,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Category Tabs
//             SizedBox(
//               height: 52,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCategoryIndex = index;
//                       });
//                     },
//                     child: CategoryTab(
//                       title: categories[index],
//                       isSelected: index == selectedCategoryIndex,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             //MoviesGrid
//             MoviesGrid(
//                 moviesByCategory: moviesByCategory,
//                 categories: categories,
//                 selectedCategoryIndex: selectedCategoryIndex),
//           ],
//         ),
//       ),
//     );
//   }
// }
