import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
 with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
    );

    setRotation(15);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  Color primaryColor = const Color(0xffB7935F);
  int tsbiha = 0;

  @override
  Widget build(BuildContext context) {
    String aya = AppLocalizations.of(context)!.sbhanalah;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
          child: InkWell(
            onTap: () {
              controller.forward(from: 0);
              tsbiha++ ;
              if(tsbiha == 34 && aya == AppLocalizations.of(context)!.sbhanalah)
                {
                  aya = AppLocalizations.of(context)!.azkoralah;

                }else if(tsbiha == 34 && aya == AppLocalizations.of(context)!.azkoralah ){

                aya = AppLocalizations.of(context)!.elhamdLlah;
              }else if(tsbiha == 34 && aya == AppLocalizations.of(context)!.elhamdLlah){
                tsbiha = 0;
                aya = AppLocalizations.of(context)!.sbhanalah;
              }
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.height*0.3,
                  height:MediaQuery.of(context).size.width*0.3 ,
                  child: const Image(
                    image: const AssetImage("assets/images/head-of-seb7a.png"),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      child: Container(
                        width: MediaQuery.of(context).size.height*0.5,
                        height:MediaQuery.of(context).size.width*0.5 ,
                        child: Image(
                            image: const AssetImage(
                                "assets/images/body-of-seb7a.png")),
                      ),
                      builder: (context , child) => Transform.rotate(
                          angle: animation.value,
                        child: child,
                      ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
         Center(
          child: Text(
            AppLocalizations.of(context)!.numberOfPraises,
            style: TextStyle(
                color: Theme.of(context).cardColor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
                color: Color.fromRGBO(183, 147, 95, 0.8),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Text(
                "$tsbiha",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: Color.fromRGBO(183, 147, 95, 0.8),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Text(
                 "$aya",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
