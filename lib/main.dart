import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale("en");
  bool language = false;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      language = pref.getBool("language") ?? false;
    });
  }

  setLanguage(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("language", value);  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    getLanguage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: language ? const Locale("bn") : const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('bn'), // Bangla
      ],
      home: HomePage(
          getLanguage: getLanguage,
          setLanguage: setLanguage,
          language: language),
    );
  }
}
