import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {super.key,
      required this.language,
      required this.getLanguage,
      required this.setLanguage});

  final void Function(bool value) setLanguage;
  final void Function() getLanguage;
  bool language = false;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    widget.getLanguage;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        backgroundColor: Colors.green,
        actions: [
          Switch(
              value: widget.language,
              onChanged: (value) {
                widget.language = value;
                widget.setLanguage(value);

              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            AppLocalizations.of(context)!.bangladesh,
            style: const TextStyle(fontSize: 16),
          ),
        )),
      ),
    );
  }
}
