import 'package:advanced_app/presentation/resources/routes_manager.dart';
import 'package:advanced_app/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();
  int appState=0;

  static final MyApp _instance=MyApp._internal(); // singleton or single instance

  factory MyApp() =>_instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,

      theme: getApplicationTheme(),
    );
  }
}
