import 'package:evehicle/app/modules/home/home_page.dart';
import 'package:evehicle/app/modules/login/login_page.dart';
import 'package:evehicle/app/modules/profile/profile_page.dart';
import 'package:evehicle/app/modules/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String location = '/location';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialRoute: (context) => SplashScreen(),
      login: (context) => LoginPage(),
      home: (context) => HomePage(),
      location: (context) => LoginPage(),
      profile: (context) => ProfilePage(),
    };
  }
}
