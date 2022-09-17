import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app1/models/Hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/ThemeProvider.dart';

class AhadethPage extends StatefulWidget {
  @override
  State<AhadethPage> createState() => _AhadethPageState();
}

class _AhadethPageState extends State<AhadethPage> {
  Color primaryColor = const Color(0xffB7935F);
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
              AppLocalizations.of(context)!.ahadeth,
              style: TextStyle(color: Theme.of(context).cardColor),
            ),
            centerTitle: true,
          ),
          body: Center(
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
                      Text(hadeth.title,
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
                        child: Text(
                          "${hadeth.content}",
                          textDirection: TextDirection.rtl,
                          style:Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
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
}
