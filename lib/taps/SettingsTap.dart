import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/providers/ThemeProvider.dart';
import 'package:quran_app1/screens/BottomSheetTheme.dart';
import '../providers/localProvider.dart';
import '../screens/BottomSheetStyle.dart';



class SettingsTap extends StatefulWidget {
   SettingsTap({Key? key}) : super(key: key);


  @override
  State<SettingsTap> createState() => _SettingsTapState();
}
 late LocaleProvider localeProvider;
late ThemeProvider themeProvider;
class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    localeProvider = Provider.of(context);
    themeProvider = Provider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height:MediaQuery.of(context).size.height*0.1 ,),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
          child: Text(
              AppLocalizations.of(context)!.language,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge,
          ),

        ),
        InkWell(
          onTap: (){
            showBottomSheetLang();
          },
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            color: Colors.white,
            child: Row(
              children: [
                Text(localeProvider.currentLocale =="en" ? "English": "العربية"),
                Spacer(),
                Icon(Icons.arrow_downward_outlined)
              ],
            ),
          ),
        ),
        SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
          child: Text(
            AppLocalizations.of(context)!.theme,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge,
          ),

        ),
        InkWell(
          onTap: (){
            showBottomSheetTheme();
          },
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            color: Colors.white,
            child: Row(
              children: [
                Text(themeProvider.currentTheme ==ThemeMode.light ? "Light": "Dark"),
                Spacer(),
                Icon(Icons.arrow_downward_outlined)

              ],
            ),
          ),
        )
      ],
    );
  }
  void showBottomSheetLang(){
      showModalBottomSheet(
          context: context,

          builder: (context){
            return  bottomSheetStyle();
          },
      );
  }

  void showBottomSheetTheme() {
    showModalBottomSheet(
      context: context,

      builder: (context){
        return  bottomSheetTheme();
      },
    );
  }
}

