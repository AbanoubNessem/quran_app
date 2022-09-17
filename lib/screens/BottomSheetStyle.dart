import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/providers/localProvider.dart';
import 'package:quran_app1/taps/SettingsTap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottomSheetStyle extends StatefulWidget {
  bottomSheetStyle({Key? key}) : super(key: key);

  @override
  State<bottomSheetStyle> createState() => _bottomSheetStyleState();
}

class _bottomSheetStyleState extends State<bottomSheetStyle> {
  late LocaleProvider localeProvider;

  Color primaryColor = const Color(0xffB7935F);

  @override
  Widget build(BuildContext context) {
    localeProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              localeProvider.changeCurrentLocale("en");
              Navigator.pop(context);
              // final  prefs = await SharedPreferences.getInstance();
              // prefs.setString('locale',"en");
            },
              child: getSelectedlang("en")),
          SizedBox(
            height: 10,
          ),
          InkWell (
              onTap: () {
                localeProvider.changeCurrentLocale("ar");
                Navigator.pop(context);
                // final  prefs = await SharedPreferences.getInstance();
                // prefs.setString('locale',"ar");
              },
              child: getSelectedlang('ar'))
        ],
      ),
    );
  }

  Widget getSelectedlang(String locale) {
    return localeProvider.currentLocale == locale
        ? Row(
            children: [
              Text(
                locale == "en" ? "English" : "العربية",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              Icon(
                Icons.done,
                color: primaryColor,
              )
            ],
          )
        : Text(
            locale == "en" ? "English" : "العربية",
            style:  Theme.of(context).textTheme.titleSmall,
          );
  }
}
