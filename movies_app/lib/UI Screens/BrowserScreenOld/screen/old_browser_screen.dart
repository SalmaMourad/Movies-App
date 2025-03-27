// working 2bl t2sim l code 27tiaty

// import 'package:flutter/material.dart';
// import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';

// class BrowserScreen extends StatefulWidget {
//   @override
//   _BrowserScreenState createState() => _BrowserScreenState();
// }

// class _BrowserScreenState extends State<BrowserScreen> {
//   int selectedCategoryIndex = 0; // Tracks selected category
//   List<String> categories = [
//     "Action",
//     "Adventure",
//     "Animation",
//     "Biography",
//     "Comedy"
//   ];

//   // Dummy movie data for each category
//   Map<String, List<String>> moviesByCategory = {
//     "Action": [
//       "Assets/Images/blackWidowPoster.jpg",
//       "assets/images/action2.jpg"
//     ],
//     "Adventure": [
//       "assets/images/adventure1.jpg",
//       "Assets/Images/blackWidowPoster.jpg"
//     ],
//     "Animation": [
//       "assets/images/animation1.jpg",
//       "assets/images/animation2.jpg"
//     ],
//     "Biography": [
//       "assets/images/biography1.jpg",
//       "assets/images/biography2.jpg"
//     ],
//     "Comedy": ["assets/images/comedy1.jpg", "assets/images/comedy2.jpg"],
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
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

//             // Movies Grid
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 7,
//                     mainAxisSpacing: 7,
//                     childAspectRatio: 0.7,
//                   ),
//                   itemCount:
//                       moviesByCategory[categories[selectedCategoryIndex]]!.length,
//                   itemBuilder: (context, index) {
//                     return MovieCard(
//                       movieImagePath: moviesByCategory[
//                           categories[selectedCategoryIndex]]![index],
//                       movieRating: '7.8',
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Custom Category Tab Widget
// class CategoryTab extends StatelessWidget {
//   final String title;
//   final bool isSelected;

//   const CategoryTab({required this.title, this.isSelected = false, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48,
//       // width: 104,
//       margin: EdgeInsets.only(left: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.amber : Colors.black,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.amber, width: 2),
//       ),
//       child: Text(textAlign: TextAlign.center,
//         title,
//         style: TextStyle(
//           color: isSelected ? Colors.black : Colors.amber,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';

// // class BrowserScreen extends StatelessWidget {
// //   final List<String> categories = [
// //     "Action", "Adventure", "Animation", "Biography", "Comedy"
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       backgroundColor: Colors.black, // Set background to match the style
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Category Tabs
// //           SizedBox(
// //             height: 60, // Adjust the height of the tab section
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //               itemCount: categories.length,
// //               itemBuilder: (context, index) {
// //                 return Padding(
// //                   padding: const EdgeInsets.only(right: 10),
// //                   child: CategoryTab(title: categories[index], isSelected: index == 0), // Highlight "Adventure"
// //                 );
// //               },
// //             ),
// //           ),

// //           // Movies Grid
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //               child: GridView.builder(
// //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 7, // Space between items
// //                   mainAxisSpacing: 7, // Vertical spacing
// //                   childAspectRatio: 0.7, // Item size ratio
// //                 ),
// //                 itemCount: 8,
// //                 itemBuilder: (context, index) {
// //                   return  MovieCard(
// //                     movieImagePath: 'Assets/Images/blackWidowPoster.jpg',
// //                     movieRating: '7.8',
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // Custom Category Tab Widget
// // class CategoryTab extends StatelessWidget {
// //   final String title;
// //   final bool isSelected;

// //   const CategoryTab({required this.title, this.isSelected = false, Key? key})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //       decoration: BoxDecoration(
// //         color: isSelected ? Colors.amber : Colors.black,
// //         borderRadius: BorderRadius.circular(20),
// //         border: Border.all(color: Colors.yellow, width: 2),
// //       ),
// //       child: Text(
// //         title,
// //         style: TextStyle(
// //           color: isSelected ? Colors.black : Colors.yellow,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'dart:math';

// // // import 'package:flutter/material.dart';
// // // import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';

// // // class BrowserScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: GridView.builder(
// // //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //             crossAxisCount: 2,
// // //             crossAxisSpacing: 7, //space between items
// // //             mainAxisSpacing: 7, //vertical spacing
// // //             childAspectRatio: 0.7, //items size ratio
// // //           ),
// // //           itemCount: 8,
// // //           itemBuilder: (context, index) {
// // //             return MovieCard(movieImagePath: 'Assets/Images/blackWidowPoster.jpg',movieRating: '7.8',);
// // //           }),
// // //     );
// // //   }
// // // }
