import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/cards.dart';

class sttlsfeed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.background,

      body: SingleChildScrollView(
        child: Container(
          color: Appcolors.background,
          height: MediaQuery. of(context). size. height,
          width: MediaQuery. of(context). size. width,
          child: UserCards(),
          ),

        ),
      );
  }
}