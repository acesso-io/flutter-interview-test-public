import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_interview_test/core/di/injection_module.dart';
import 'package:flutter_interview_test/core/resources/themes.dart';
import 'package:flutter_interview_test/presentation/character_list/character_list_view.dart';

void main() {
  InjectionModule.register();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return MaterialApp(
      title: 'Rick and Morty',
      navigatorKey: navigatorKey,
      theme: Themes.appTheme(context),
      home: CharacterListView(),
    );
  }
}
