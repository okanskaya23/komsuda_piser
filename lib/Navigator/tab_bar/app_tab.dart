import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
class CustomTab extends StatelessWidget {
  CustomTab({@required this.title, @required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Icon(
          icon,
          color: Appcolors.text,
        ),
    );
  }
}
