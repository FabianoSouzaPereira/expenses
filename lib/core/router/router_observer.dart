import 'package:flutter/material.dart';

class GoRouterObserverGlobal extends NavigatorObserver {
  List<String> routeStack = [];

  void _printStack() {
    debugPrint('--- Navigation Stack ---');
    for (var i = 0; i < routeStack.length; i++) {
      debugPrint(routeStack[i]);
    }
    debugPrint('--- /Navigation Stack ---');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
    _printStack();
    navigator?.widget.toString(minLevel: DiagnosticLevel.debug);
    // debugPrint(
    //     'GoRoute didPop: ${route.settings.name}, previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route.settings.name ?? '');
    _printStack();
    // debugPrint(
    //     'GoRoute didPush: ${route.settings.name}, previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.remove(route.settings.name);
    _printStack();
    // debugPrint(
    //     'GoRoute didRemove: ${route.settings.name}, previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) {
      routeStack.remove(oldRoute.settings.name);
    }
    routeStack.add(newRoute?.settings.name ?? '');
    _printStack();
    // debugPrint(
    //     'GoRoute didReplace: ${newRoute?.settings.name}, previousRoute: ${oldRoute?.settings.name}');
  }
}
