import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/db/Login/Login.dart';
import 'package:movies_app/db/Login/home.dart';
import 'package:movies_app/db/OnBoarding/onBoarding.dart';
import 'package:movies_app/db/Register/register.dart';
import 'package:movies_app/db/Splash%20Screen/splash.dart';
import 'package:movies_app/db/UpradeProfile/upgrade_profile.dart';
import 'package:movies_app/db/forget%20password/forget_password.dart';
import 'package:movies_app/db/profile/profile_screen.dart';
import 'package:movies_app/db/firebase_options.dart';
import 'package:movies_app/db/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: const Color(0xffFFBB3B),
        colorScheme: const ColorScheme.light(
          primary: Color(0xffFFBB3B),
          secondary: Colors.white,
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        UserProfileScreen.routeName: (context) => UserProfileScreen(),
      },
    );
  }
}
