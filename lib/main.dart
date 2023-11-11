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
  String language = "en";
  bool switchStatus = false;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      language = pref.getString("language") ?? 'en';
      switchStatus = pref.getBool("switchStatus") ?? false;
    });
  }

  setLanguage(String value, bool switchStatus) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("language", value);
    pref.setBool("switchStatus", switchStatus);
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
      locale: Locale(language),
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
      home: HomePage(setLanguage: setLanguage, switchStatus: switchStatus, ),
    );
  }
}
