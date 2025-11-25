import 'package:flutter/material.dart';

class NavigatorHelper {
  /// Push to new screen
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    Widget screen, {
    bool replace = false,
    Object? arguments,
  }) async {
    final route = MaterialPageRoute<T>(
      builder: (context) => screen,
      settings: RouteSettings(arguments: arguments),
    );

    if (replace) {
      return Navigator.pushReplacement(context, route);
    } else {
      return Navigator.push(context, route);
    }
  }

  /// Push to a named route using generics
  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacementNamed(
        context,
        routeName,
        result: ModalRoute.of(context)?.currentResult,
        arguments: arguments,
      );
    } else {
      return Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }

  /// Push and replacement
  static Future<T?> pushReplacementNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(
      context,
      routeName,
      result: ModalRoute.of(context)?.currentResult,
      arguments: arguments,
    );
  }

  /// Pop the currenct route with generics
  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      Navigator.of(context).pop(result);

  /// Push remove until
  static Future<T?> pushRemoveUntil<T extends Object?>(
    BuildContext context,
    Widget screen,
  ) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false,
    );
  }
}
