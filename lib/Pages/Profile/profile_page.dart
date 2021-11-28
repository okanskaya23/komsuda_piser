import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Profile/BannerSection.dart';
import 'package:komsuda_piser_local/Pages/Profile/header.dart';
import 'package:komsuda_piser_local/Pages/Profile/header_container.dart';
import 'package:komsuda_piser_local/Pages/Profile/top_menu.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//import 'package:komsuda_piser_local/Pages/Profile/SizeConfig.dart';
import 'package:komsuda_piser_local/Pages/Profile/constants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileFirstState createState() => _ProfileFirstState();
}

class _ProfileFirstState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.deepOrangeAccent,
                            Colors.pinkAccent
                          ])),
                      child: Container(
                        width: width * 0.33,
                        height: height,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.internethaber.com%2Fherkesin-aradigi-o-teyze-bakin-nerede-bulundu-foto-galerisi-1738466.htm&psig=AOvVaw1MkNgd-ECzkHxImPx8Gbe1&ust=1638199752565000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOCwtOmvu_QCFQAAAAAdAAAAABAV"),
                                radius: 50.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Ayşe Hanım",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                clipBehavior: Clip.antiAlias,
                                color: Colors.white,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 22.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Sold food",
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "120",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.pinkAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Rating",
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "9.8",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.pinkAccent,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.33,
                        height: height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Menu:",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 28.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'My name is Ayşe and I am  a freelance meal cooker. If you need any yaprak sarma '
                                    'for your dinner then click on the button',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.33,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Appcolors.background,
                              //onSurface: Appcolors.background,
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [Colors.redAccent, Colors.pinkAccent]),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Container(
                                constraints:
                                BoxConstraints(maxWidth: 3000.0, minHeight: 50.0),
                                alignment: Alignment.center,

                                child: Text(
                                  "Give Order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
