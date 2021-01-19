import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_todo/core/constants/view_routes.dart';
import 'package:flutter_todo/ui/shared/dialog_content.dart';

import 'views/main_view.dart';
import 'views/splash_view.dart';


/// Class that generates routes for the application
///   - Routes are generated by the list of routes in the app
///   - Routes can also require parameters. e.g. `PostDetailView(post: post)`
class Router {
  static Route<dynamic> generateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    return platformPageRoute(
      context: context,
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {

      // Tab Views
      case ViewRoutes.main:
        return MainView();

      case ViewRoutes.splash:
        return SplashView();

      case ViewRoutes.task:
        return DialogContent();
      // case ViewRoutes.post_details:
      //   final post = settings.arguments as Post;
      //   return PostDetailsView(post: post);

      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
     ViewRoutes.splash
    // Routes.route_1,
    // Routes.route_2,
  ];
}