import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedAvatarIndex = 1; //
// String path='Assets/Images/Fatma';
  final List<String> avatars = [
    'Assets/Images/Fatma/avatar1.png',
    'Assets/Images/Fatma/avatar2.png',
    'Assets/Images/Fatma/avatar3.png',
    'Assets/Images/Fatma/avatar4.png',
    'Assets/Images/Fatma/avatar5.png',
    'Assets/Images/Fatma/avatar6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.yellow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Pick Avatar",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(avatars[selectedAvatarIndex]),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                prefixIcon: const Icon(Icons.person, color: Colors.grey),
                hintText: "Fatma Khaled",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                hintText: "01200000000",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Reset Password",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: avatars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatarIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedAvatarIndex == index
                              ? Colors.yellow
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(avatars[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: UpdateProfileScreen(),
//     );
//   }
// }

// class UpdateProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: Text("Pick Avatar", style: TextStyle(color: Colors.amber)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.amber),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.white,
//               child: Image.asset("assets/avatar.PNG.png"),
//             ),
//             SizedBox(height: 20),
//             buildTextField(Icons.person, "John Safwat"),
//             SizedBox(height: 10),
//             buildTextField(Icons.phone, "012000000000"),
//             SizedBox(height: 15),
//             GestureDetector(
//               onTap: () {

//               },
//               child: Text(
//                 "Reset Password",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             Spacer(),
//             buildButton("Delete Account", Colors.red, () {}),
//             SizedBox(height: 10),
//             buildButton("Update Data", Colors.amber, () {}),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(IconData icon, String text) {
//     return TextField(
//       readOnly: true,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.white),
//         hintText: text,
//         hintStyle: TextStyle(color: Colors.white),
//         filled: true,
//         fillColor: Colors.grey[900],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: TextStyle(color: Colors.white),
//     );
//   }

//   Widget buildButton(String text, Color color, VoidCallback onPressed) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
