import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kraya/src/core/enums.dart';
import 'package:kraya/src/features/authentication/presentation/logic/language/language_cubit.dart';
import 'src/core/router.dart';
import 'src/features/init/presentation/logic/session_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'src/core/colors.dart';
import 'src/core/dependency_injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initDependencies();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => sl<SessionBloc>()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const EntryPoint(),
    ),
  );
  //! Remove splash screen when setup is complete
  // FlutterNativeSplash.remove();
}

class EntryPoint extends StatelessWidget {

  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (_, state) {
        final LanguageEnum data = state.languageSelection;
        late String selection = "";
        if (data == LanguageEnum.english) {
          selection = "en";
        } else {
          selection = "bn";
        }
        return MaterialApp.router(
          title: 'Kraya',
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizations.of(context).appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(selection),
          theme: ThemeData(primarySwatch: Colors.blue),
          routerConfig: router,
          //! fixes: overlay bug while scrolling
          builder: (context, child) =>
              MediaQuery(
                data: MediaQuery.of(context).copyWith(accessibleNavigation: false),
                child: child!,
              ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
