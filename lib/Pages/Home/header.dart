import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Home/top_menu.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';


class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Komsuda Piser",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w900,
            color: Appcolors.secondary,
          ),
        ),
        Spacer(),
        HeaderWebMenu(),
        Spacer(),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey.withOpacity(0.3))),
            child:  TextFormField(
                decoration: InputDecoration(
                  prefixIcon:
                  Icon(Icons.search, color: Colors.black),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Appcolors.secondary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}