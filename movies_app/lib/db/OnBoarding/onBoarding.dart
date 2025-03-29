import 'package:flutter/material.dart';
import 'package:movies_app/db/Login/Login.dart';
import 'package:movies_app/db/OnBoarding/OnboardingPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  static const String routeName = '/onboarding';
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0; // تتبع الصفحة الحالية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index; // تحديث الصفحة الحالية
              });
            },
            children: [
              OnboardingPage(
                title: "Find Your Next Favorite Movie",
                description:
                    "Get access to a huge library of movies to suit all tastes.",
                imagePath: "Assets/Images/OnBoarding1.png",
              ),
              OnboardingPage(
                title: "Discover Movies",
                description:
                    "Explore a vast collection of movies in all qualities and genres. "
                    "Find your next favorite film with ease.",
                imagePath: "Assets/Images/OnBoarding2.png",
              ),
              OnboardingPage(
                title: "Explore All Genres",
                description:
                    "Discover movies from every genre, in all available qualities. "
                    "Find something new and exciting to watch every day.",
                imagePath: "Assets/Images/OnBoarding3.png",
              ),
              OnboardingPage(
                title: "Create Watchlists",
                description:
                    "Save movies to your watchlist to keep track of what you want to watch next. "
                    "Enjoy films in various qualities and genres.",
                imagePath: "Assets/Images/OnBoarding4.png",
              ),
              OnboardingPage(
                title: "Rate, Review, and Learn",
                description:
                    "Share your thoughts on the movies you've watched. Dive deep into film details "
                    "and help others discover great movies with your reviews.",
                imagePath: "Assets/Images/OnBoarding5.png",
              ),
              OnboardingPage(
                title: "Start Watching Now",
                description:
                    "Dive into the world of movies and enjoy watching anytime, anywhere.",
                imagePath: "Assets/Images/OnBoarding6.png",
              ),
            ],
          ),

          // تأثير التعتيم السفلي
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.black.withOpacity(0),
          //           Colors.black.withOpacity(0.1),
          //           Colors.black.withOpacity(0.9),
          //           Colors.black.withOpacity(0.9),
          //         ],
          //         stops: [0.3, 0.6, 0.8, 1],
          //       ),
          //     ),
          //   ),
          // ),

          // مؤشر الصفحات
          // Positioned(
          //   bottom: 100,
          //   left: 20,
          //   right: 20,
          //   child: SmoothPageIndicator(
          //     controller: _controller,
          //     count: 6, // عدد الصفحات أصبح 6
          //     effect: ExpandingDotsEffect(
          //       activeDotColor: Colors.yellow,
          //       dotHeight: 8,
          //       dotWidth: 8,
          //     ),
          //   ),
          // ),

          // أزرار التنقل
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      if (currentPage == 5) {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentPage == 5 ? "Finish" : "Next",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 15,),
                  if (currentPage > 0)

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: Colors.yellow),
                        ),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.yellow, fontSize: 16),
                      ),
                    ),
                                    
                  // زر التقدم للأمام / Finish
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
