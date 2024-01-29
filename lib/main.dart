import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kraya/business_logic/language/language_cubit.dart';
import 'package:kraya/generated/l10n.dart';
import 'package:kraya/features/login/presentation/pages/login_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/app_router.dart';
import 'core/colors.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorSystem.instance.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  final AppRouter router = AppRouter();

  runApp(MultiProvider(providers: [
    BlocProvider(create: (_) => LanguageCubit()),
  ], child: MyApp(router)));
}

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp(this.router, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (_, state) {
        final String data = state.languageSelection;
        late String selection = "";
        if (data == "LanguageEnum.english") {
          selection = "en";
        } else {
          selection = "bn";
        }
        return MaterialApp(
          title: 'Kraya',
          localizationsDelegates: const [
            AppLocalizationDelegate(),
          ],
          locale: Locale(selection),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
          onGenerateRoute: (settings) => router.onGenerate(settings),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
