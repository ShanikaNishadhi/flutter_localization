import 'package:flutter/material.dart';
import 'package:flutter_i18n_intl/classes/language.dart';
import 'package:flutter_i18n_intl/localization/language_constants.dart';
import 'package:flutter_i18n_intl/main.dart';
import 'package:flutter_i18n_intl/generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsPageAppBarTitle),
      ),
      body: Container(
        child: Center(
            child: DropdownButton<Language>(
          iconSize: 30,
          hint: Text(S.of(context).formFieldChangeLanguage),
          onChanged: (Language language) {
            _changeLanguage(language);
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        )),
      ),
    );
  }
}
