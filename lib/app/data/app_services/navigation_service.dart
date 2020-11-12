import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  BuildContext get context => _navigationKey.currentState.overlay.context;

  void pop() {
    return _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateToNamed(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToNamedAndReplace(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToNamedAndReplaceAll(String routeName, {dynamic arguments}) {
    // how to get the arguments
    return _navigationKey.currentState
        .pushNamedAndRemoveUntil(routeName, (_) => true, arguments: arguments);
  }

  Future<dynamic> navigateTo(Widget route, {dynamic arguments}) {
    // how to get the arguments
    return _navigationKey.currentState
        .push(CupertinoPageRoute(builder: (_) => route, settings: RouteSettings(arguments: arguments)));
  }

  Future<dynamic> navigateToAndReplace(Widget route, {dynamic arguments}) {
    // how to get the arguments
    return _navigationKey.currentState
        .pushReplacement(CupertinoPageRoute(builder: (_) => route, settings: RouteSettings(arguments: arguments)));
  }

  Future<dynamic> navigateToAndReplaceAll(Widget route, {dynamic arguments}) {
    // how to get the arguments
    return _navigationKey.currentState
        .pushAndRemoveUntil(CupertinoPageRoute(builder: (_) => route, settings: RouteSettings(arguments: arguments)), (_) => true);
  }
}

