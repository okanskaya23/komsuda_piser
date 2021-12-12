import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Pages/Home/constants.dart';
import 'package:komsuda_piser_local/Pages/Home/BannerSection.dart';



class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Appcolors.background,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kPadding),
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: Column(
              children: <Widget>[
                //Header(),
                SizedBox(
                  height: 20,
                ),
                BannerSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}