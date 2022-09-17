import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/providers/ThemeProvider.dart';
import 'package:quran_app1/taps/AhadethTap.dart';
import 'package:quran_app1/taps/QuranTap.dart';
import 'package:quran_app1/taps/RadioTap.dart';
import 'package:quran_app1/taps/SebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app1/taps/SettingsTap.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color primaryColor = const Color(0xffB7935F);
  int currentIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    SebhaTab(),
    const RadioTab(),
    SettingsTap(),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Stack(
      children: [
        Image.asset(
          themeProvider.currentTheme == ThemeMode.light?
          "assets/images/bg3.png":
          "assets/images/bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title:  Text(
              AppLocalizations.of(context)!.islami,
              style: TextStyle(color: Theme.of(context).cardColor),
            ),
            centerTitle: true,
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                  onTap: (currentTap) {
                    currentIndex = currentTap;
                    setState(() {});
                  },
                  currentIndex: currentIndex,
                  selectedLabelStyle: TextStyle(color: Colors.black),
                  selectedItemColor:  Theme.of(context).hoverColor,
                  selectedIconTheme:  IconThemeData(color:Theme.of(context).hoverColor),
                  items:  [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/moshaf_gold.png")),
                        label: AppLocalizations.of(context)!.quran),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("assets/images/sora.png")),
                        label: AppLocalizations.of(context)!.ahadeth),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/sebha_blue.png")),
                        label: AppLocalizations.of(context)!.sebha),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/radio_blue.png")),
                        label: AppLocalizations.of(context)!.elradio),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings_outlined),
                        label: AppLocalizations.of(context)!.settings),
                  ])),
        )
      ],
    );
  }
}
