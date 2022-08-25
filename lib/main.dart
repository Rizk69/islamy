import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamyverson1/Themes/MyTheme.dart';
import 'package:islamyverson1/home/MainScreen.dart';
import 'package:islamyverson1/home/hadeth/Hadeth_deteils.dart';
import 'package:islamyverson1/home/quran/sura_deteils.dart';
import 'package:provider/provider.dart';

import 'home/providers/Settingprovider.dart';

void main() {
  runApp(ChangeNotifierProvider<Settingprovider>(
      create: (buildcontext) {
        return Settingprovider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);
    return MaterialApp(
      theme: MyTheme.lighttheme,
      themeMode: settingprovider.currentTheme,
      darkTheme: MyTheme.darktheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.routename,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English, no country code
        Locale('ar'), // arabic, no country code
      ],
      locale: Locale(settingprovider.curentlang),
      routes: {
        Homescreen.routename: (_) => Homescreen(),
        Suradeteils.routename: (_) => Suradeteils(),
        Hadethdeteils.routename: (_) => Hadethdeteils(),
      },
    );
  }
}
