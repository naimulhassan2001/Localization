import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {super.key,
      required this.switchStatus,
      required this.setLanguage});

  final void Function(String value, bool swich) setLanguage;
  bool switchStatus ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        backgroundColor: Colors.green,
        actions: [
          Switch(
              value: widget.switchStatus,
              onChanged: (value) {
                setState(() {
                  widget.switchStatus = value ;
                });

                if(value){
                  widget.setLanguage('bn', true);
                }else{
                  widget.setLanguage('en', false) ;

                }

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
