import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_todo/core/managers/core_manager.dart';
import 'package:flutter_todo/core/services/modal/modal_service.dart';
import 'package:flutter_todo/provider_setup.dart';
import 'package:provider/provider.dart';
import 'core/managers/modal_sheet_manager.dart';
import 'ui/router.dart';
import 'ui/shared/themes.dart' as themes;

import 'core/services/navigation/navigation_service.dart';
import 'locator.dart';
import 'ui/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final navigationService = locator<NavigationService>();
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: CoreManager(
        child: PlatformApp(
          debugShowCheckedModeBanner: false,
          android: (_) => MaterialAppData(
            theme: themes.primaryMaterialTheme,
            darkTheme: themes.darkMaterialTheme
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: (settings) =>
              Router.generateRoute(context, settings),
          title: 'ToDo',
          builder: _setupModalSheetManager,
          home: SplashView(),
        ),
      ),
    );
  }

  Widget _setupModalSheetManager(context, widget){
    return Navigator(
      key: locator<ModalService>().modalNavigationKey,
      onGenerateRoute: (settings) => platformPageRoute(
        context: context,
        builder: (context) => ModalSheetManager(child: widget),
      ),
    );
  }
}

