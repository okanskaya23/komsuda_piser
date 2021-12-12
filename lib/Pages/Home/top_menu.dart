import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Home/constants.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        HeaderMenu(
          press: () {},
          title: "Menu",
        ),
        SizedBox(width: kPadding),
        HeaderMenu(
          press: () {},
          title: "For Riders",
        ),
        SizedBox(width: kPadding),
        HeaderMenu(
          press: () {},
          title: "About",
        ),
        SizedBox(width: kPadding),
        HeaderMenu(
          press: () {},
          title: "Reviews",
        ),
        SizedBox(width: kPadding),
        HeaderMenu(
          press: () {},
          title: "Restaurants",
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget{
  const HeaderMenu({
    Key key, @required this.title, @required this.press
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext cotext){
    return InkWell(
      onTap: (){},
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,),
        ),
      ),
    );
  }
}
