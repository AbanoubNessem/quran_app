import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app1/models/Hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({Key? key}) : super(key: key);

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  Color primaryColor = const Color(0xffB7935F);
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty) readahadeth();
    return ahadeth.isNotEmpty ? Column(
      children: [
        const Center(
            child: Image(image: AssetImage("assets/images/AhadethImage.png"))),
        Divider(thickness: 4, color: primaryColor),
         Center(
          child: Text(
            AppLocalizations.of(context)!.ahadeth,
            style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.bold,fontSize: 24),
          ),
        ),
        Divider(
          thickness: 4,
          color: primaryColor,
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "AhadethPage",arguments: ahadeth[index]);
                    },
                    child: Center(
                      child: Text(ahadeth[index].title,style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  );
                },
                separatorBuilder: (context,index) =>  Divider(
                  thickness: 2,
                  color: primaryColor,),
                itemCount: ahadeth.length
            )
        )
      ],
    ) : Center(child: CircularProgressIndicator(),);
  }
  void readahadeth() async {
    String ahadethContent = await rootBundle.loadString("assets/ahadethName.txt");
    List<String> ahadeth = ahadethContent.split("#\r\n");
    for(int i=0 ; i<ahadeth.length ; i++){
      String hadethContent = ahadeth[i];
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = new Hadeth(title: title, content: hadethLines);
      this.ahadeth.add(hadeth);
    }
    setState((){});
  }
}
