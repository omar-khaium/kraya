import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kraya/core/app_router.dart';
import 'package:kraya/core/colors.dart';
import 'package:kraya/ui/screen/screen_login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorSystem.instance.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  final AppRouter router = AppRouter();

  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp(this.router, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kraya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      onGenerateRoute: (settings) => router.onGenerate(settings),
    );
  }
}
