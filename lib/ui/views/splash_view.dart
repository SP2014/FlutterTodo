import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/core/constants/animations.dart';
import 'package:flutter_todo/core/services/local_storage/local_storage_service.dart';
import 'package:flutter_todo/locator.dart';
import 'package:flutter_todo/ui/views/main_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final targetPlatform = Theme.of(context).platform;
    final backgroundColor = targetPlatform == TargetPlatform.android
        ? Theme.of(context).primaryColor
        : CupertinoTheme.of(context).primaryColor;

    return SplashScreen.navigate(
      backgroundColor: backgroundColor,
      width: 100.0,
      next: (_) => MainView(),
      until: () async {
        await Future.wait([locator<LocalStorageService>().init()]);
      },
      loopAnimation: Animations.start_name,
      name: Animations.loader,
    );
  }
}
