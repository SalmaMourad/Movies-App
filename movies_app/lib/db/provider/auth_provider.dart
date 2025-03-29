import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/db/dao/user_dao.dart';
import 'package:movies_app/db/model/app_user.dart';

class AuthProvider extends ChangeNotifier {
  AppUser? appUser;
  User? firebaseAuthUser;

  AuthProvider() {
    firebaseAuthUser = FirebaseAuth.instance.currentUser;
    if (firebaseAuthUser != null) {
      readUser();
    }
  }

  void readUser() async {
    if (firebaseAuthUser != null) {
      try {
        appUser = await UsersDao.readUser(firebaseAuthUser!.uid);
      } catch (e) {
        print("Error reading user data: $e");
        appUser =
            null; // تجنب حدوث كراش في حالة عدم وجود بيانات للمستخدم الجديد
      }
      notifyListeners();
    }

    notifyListeners();
  }

  bool isLoggedIn() {
    return firebaseAuthUser != null;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    appUser = null;
    firebaseAuthUser = null;
    notifyListeners();
  }

  void saveUser(AppUser? user, {String? phone}) {
    appUser = user;
    if (phone != null) {
      appUser?.phone = phone;
    }
    firebaseAuthUser = FirebaseAuth.instance.currentUser;

    // تأكد من أن البيانات محفوظة في قاعدة البيانات
    // if (appUser != null) {
    //   UsersDao.createOrUpdateUser(appUser!);
    // }

    notifyListeners();
  }

  void setUser(User user) {}
}
