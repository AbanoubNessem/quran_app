import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/taps/QuranTap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/ThemeProvider.dart';

class QuranPage extends StatefulWidget {
  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  Color primaryColor = const Color(0xffB7935F);
  String suraContent = "";
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as suraArguments;
    readFile(args.fileName);
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
            foregroundColor: Theme.of(context).cardColor,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title:  Text(
              AppLocalizations.of(context)!.quran,
              style: TextStyle(color: Theme.of(context).cardColor),
            ),
            centerTitle: true,
          ),
          body: suraContent.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(args.suraName,
                                style: TextStyle(
                                    color: Theme.of(context).cardColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            Divider(
                              thickness: 1,
                              color: primaryColor,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics() ,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        "${suraLines[index]}(${index + 1})",
                                        textDirection: TextDirection.rtl,
                                        style:Theme.of(context).textTheme.headlineLarge,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                          thickness: 1,
                                          color: primaryColor,
                                        ),
                                    itemCount: suraLines.length)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }

  void readFile(String fileName) async {
    suraContent = await rootBundle.loadString("assets/suraFile/$fileName");
    suraLines = suraContent.split("\n");
    setState(() {});
  }
}
