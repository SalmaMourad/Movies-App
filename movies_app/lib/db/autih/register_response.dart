import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/db/model/app_user.dart';

class AuthResponse {
  UserCredential? userCredential;
  AppUser? user;
  Error? error;

  AuthResponse({this.userCredential, this.user, this.error});
}

class Error {
  String? errorMessage;
  Exception? exception;

  Error({this.exception, this.errorMessage});
}
