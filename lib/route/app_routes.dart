import 'package:flutter/material.dart';
import 'package:school_managment/ui/pages/auth/signup/signup.screen.dart';
import 'package:school_managment/ui/pages/chat/chat_screen.dart';
import 'package:school_managment/ui/pages/splash/splash_screen.dart';

import '../ui/pages/auth/signin/signin.screen.dart';
import '../ui/pages/classes/classes.dart';
import '../ui/pages/course_details/course_details_screen.dart';
import '../ui/pages/home/home_screen.dart';
import '../ui/pages/onboarding/on_boarding_screen.dart';
import '../ui/pages/profil/profile_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String onboarding = '/Onboarding';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String chat = '/chat';
  static const String classes = '/bus';
  static const String sessionDetails = '/session_details';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) =>  const Onboarding());
        case home:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
        case classes:
        return MaterialPageRoute(builder: (_) => const ClassesScreen());
      case sessionDetails:
        int courseId = settings.arguments as int ;
        return MaterialPageRoute(builder: (_) =>  SessionDetailsScreen(courseId: courseId));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }

  /*
   * This method will navigate to the routeName
   */
  static void navigateTo(BuildContext context, {required String routeName}) {
    // Navigator.push(context, MaterialPageRoute(builder: (builder) => widget));
    Navigator.pushNamed(context, routeName);
  }

  /*
   * This method navigate with arguments
   */
  static void navigateToWithArguments(BuildContext context,
      {required String routeName, required dynamic arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /*
   * This method will navigate to the routeName and remove all the previous routes
   */
  static void ofAndNavigateTo(BuildContext context,
      {required String routeName}) {
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) => widget), (Route<dynamic> route) => false);
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false);
  }

  /*
   * This method will navigate to the routeName and remove all the previous routes
   */
  static void offAndNavigateTo(BuildContext context,
      {required String routeName}) {
    // Navigator.of(context, rootNavigator: true).push(
    //     MaterialPageRoute(builder: (context) => widget));
    Navigator.pushReplacementNamed(context, routeName);
  }

  /*
   * This method will navigate to the routeName and remove all the previous routes
   */
  static void goTo(BuildContext context, {required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  /*
  * This method will navigate to the routeName and remove all the previous routes
   */
  static void offAllAndGoTo(BuildContext context, {required String routeName}) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false);
  }

  static void goBack(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }
}
