import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const Center(
            child: Image(image: AssetImage("assets/images/RadioImage.png"))),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
         Center(
          child: Text(
            AppLocalizations.of(context)!.radio,
            style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(image: AssetImage("assets/images/Icon-metro-next1.png")),
                Image(image: AssetImage("assets/images/Icon-awesome-play.png")),
                Image(image: AssetImage("assets/images/Icon-metro-next.png")),
              ],
            ),
          ),
        )
      ],
    );
  }
}
