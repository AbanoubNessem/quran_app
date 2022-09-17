import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  Color primaryColor = const Color(0xffB7935F);
  List<String> suraName = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Image(image: AssetImage("assets/images/QuranImage.png"))),
        Divider(thickness: 4, color: primaryColor),
         Center(
          child: Text(
            AppLocalizations.of(context)!.suraName,
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
                        Navigator.pushNamed(context, "QuranPage",arguments:suraArguments(suraName: "${suraName[index]}", fileName: "${index+1}.txt") );
                    },
                    child: Center(
                      child: Text(suraName[index],style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  );
                },
                separatorBuilder: (context,index) =>  Divider(
                  thickness: 2,
                  color: primaryColor,),
                itemCount: suraName.length
            )
        )
      ],
    );
  }
}
class suraArguments {
  String suraName;
  String fileName;
  suraArguments({ required this.suraName,required this.fileName});
}