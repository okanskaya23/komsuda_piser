import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_icon_button.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Appcolors.text,
            )
        ),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppIconButton(
                      iconData: FontAwesomeIcons.github,
                      url: 'https://github.com/okanskaya23/komsuda_piser',
                      color: Appcolors.text,
                    ),
                    SizedBox(width: screenWidth * 0.02),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text('Komşuda Pişer \u00a9 2021',
                        style: TextStyle(
                            color: Appcolors.text,
                            fontFamily: 'Barlow')
                    ),
                    FittedBox(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.2),
                          Image(
                            image: AssetImage('assets/images/pot.png'),
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
