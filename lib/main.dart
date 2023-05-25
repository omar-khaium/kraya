import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kraya/ui/screen/screen_add_bank_account.dart';
import 'package:kraya/ui/screen/screen_add_property.dart';
import 'core/app_router.dart';
import 'core/colors.dart';

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
      home: const AddPropertyScreen(),
      onGenerateRoute: (settings) => router.onGenerate(settings),
    );
  }
}
