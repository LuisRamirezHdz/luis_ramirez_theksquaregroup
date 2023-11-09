import 'package:flutter/material.dart';
import 'package:luis_ramirez_theksquaregroup/pages/list_page.dart';
import 'package:luis_ramirez_theksquaregroup/pages/user_details_page.dart';

Map<String, dynamic> routes = {
  ListPage.route: const ListPage(),
  UserDetailsPage.route: const UserDetailsPage(),
};

PageRouteBuilder getAppRoutes(settings) {
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          routes[settings.name],
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ));
}

class ScreenArguments {
  ScreenArguments({this.direction, this.value});

  DirectionTransition? direction;
  dynamic value;
}

enum DirectionTransition { top, bottom, left, right }
