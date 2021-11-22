import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;
  final double height;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;

  AppButton(
      {Key key,
        this.onPressed,
        this.text,
        this.width,
        this.height,
        this.buttonColor,
        this.borderColor,
        this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: buttonColor ?? Appcolors.third,
            side: BorderSide(width: 1, color: Appcolors.primary)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
