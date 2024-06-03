import 'package:flutter/material.dart';
import 'package:school_managment/ui/pages/auth/signin.screen.dart';
import 'package:school_managment/ui/pages/auth/signup.screen.dart';
import 'package:school_managment/ui/pages/chat_screen.dart';

import '../ui/pages/home/home_screen.dart';
import '../ui/pages/profile_screen.dart';
import '../ui/pages/session_details/session_details.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
  static const String profile = '/profile';
  static const String chat = '/chat';
  static const String sessionDetails = '/session_details';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case sessionDetails:
        return MaterialPageRoute(builder: (_) => const SessionDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
