import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/db/Login/Login.dart';
import 'package:movies_app/db/UpradeProfile/upgrade_profile.dart';
import 'watch_list_screen.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeName = '/user-profile';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() {
    setState(() {
      _user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: _user?.photoURL != null
                            ? NetworkImage(_user!.photoURL!)
                            : AssetImage("Assets/Images/gamer1.png")
                                as ImageProvider,
                        radius: 49,
                        backgroundColor: Colors.grey[800],
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.displayName ??
                                "Salma Mourad",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _user?.email ?? "example@email.com",
                            style: TextStyle(
                              color: Colors.grey,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                                // ),
                              // color: Colors.grey, fontSize: 14
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text("Edit Profile",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.routeName, (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Row(
                          children: [
                            Text("Exit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            SizedBox(width: 4),
                            Icon(Icons.logout, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(child: WatchListScreen()),
          ],
        ),
      ),
    );
  }
}
