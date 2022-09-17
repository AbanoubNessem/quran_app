
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/models/AppStyle.dart';
import 'package:quran_app1/providers/ThemeProvider.dart';
import 'package:quran_app1/providers/localProvider.dart';
import 'package:quran_app1/screens/AhadethPage.dart';
import 'package:quran_app1/screens/QuranPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app1/taps/SettingsTap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    LocaleProvider localeProvider = Provider.of(context);
    // Referense(localeProvider.currentLocale);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      locale: Locale(localeProvider.currentLocale),
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.DarkTheme,
      themeMode: themeProvider.currentTheme,
      routes: {
        "Home" : (context) => Home(),
        "AhadethPage" : (context) => AhadethPage(),
        "QuranPage" : (context) => QuranPage(),
      },
      initialRoute: "Home",
    );

  }
  // void Referense(String locale) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.get("locale");
  //   localeProvider.changeCurrentLocale(locale);
  // }
}
