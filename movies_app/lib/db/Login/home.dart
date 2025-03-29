// import 'package:flutter/material.dart';
// import 'package:movies_app/UI%20Screens/Login/Login.dart';
// import 'package:movies_app/UI%20Screens/UpradeProfile/upgrade_profile.dart';
// import 'package:movies_app/UI%20Screens/profile/profile_screen.dart';
// import 'package:movies_app/UI%20Screens/profile/watch_list_screen.dart';

// class HomeScreen extends StatelessWidget {
//   static const String routeName = '/user-profile';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16),
//               color: Colors.black,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage("Assets/Images/gamer1.png"),
//                         radius: 30,
//                         backgroundColor: Colors.grey[800],
//                       ),
//                       SizedBox(width: 12),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Fatma Khaled",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Text("12",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(width: 4),
//                               Text("Wish List",
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 14)),
//                               SizedBox(width: 16),
//                               Text("10",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(width: 4),
//                               Text("History",
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 14)),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   //  "Edit Profile" و "Exit"
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, ProfileScreen.routeName);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.yellow,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                         ),
//                         child: Text("Edit Profile",
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 14)),
//                       ),
//                       SizedBox(width: 12),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, LoginScreen.routeName);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                         ),
//                         child: Row(
//                           children: [
//                             Text("Exit",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14)),
//                             SizedBox(width: 4),
//                             Icon(Icons.logout, color: Colors.white, size: 18),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),

//             //  (Watch List & History)
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //   children: [
//             //     Column(
//             //       children: [
//             //         Icon(Icons.menu, color: Colors.yellow, size: 24),
//             //         Text("Watch List", style: TextStyle(color: Colors.yellow, fontSize: 14)),
//             //       ],
//             //     ),
//             //     Column(
//             //       children: [
//             //         Icon(Icons.folder, color: Colors.grey, size: 24),
//             //         Text("History", style: TextStyle(color: Colors.grey, fontSize: 14)),
//             //       ],
//             //     ),
//             //   ],
//             // ),

//             SizedBox(height: 16),

//             //
//             // Expanded(
//             //   child: Center(
//             //     child: Column(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: [
//             //         Icon(Icons.local_movies, color: Colors.yellow, size: 80),
//             //       ],
//             //     ),
//             //   ),
//             // ),

//             Expanded(child: WatchListScreen()),

//             //
//             // BottomNavigationBar(
//             //   backgroundColor: Colors.black,
//             //   selectedItemColor: Colors.yellow,
//             //   unselectedItemColor: Colors.grey,
//             //   showSelectedLabels: false,
//             //   showUnselectedLabels: false,
//             //   items: [
//             //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//             //     BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
//             //     BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
//             //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
