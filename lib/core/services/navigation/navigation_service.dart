import 'package:flutter/material.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<dynamic> pushNamed(String routeName, {Object arguments});

  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments});

  Future<dynamic> popAllAndPushNamed(String routeName, {Object arguments});

  bool pop({dynamic returnValue});
}
