import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Feed/User_card.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:komsuda_piser_local/Utils/objects/user_class.dart';


class feed extends StatefulWidget {

  @override
  Feed createState() => Feed();
}

class Feed extends State<feed> {
  @override
  void initState() {
    super.initState();
  }
  int postCount = 0;
  String _message = "";

  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }


  static var kus = UserClass(
      username: "cicikus",
      name: "babacik123",
      profilePic: NetworkImage(
          "https://pbs.twimg.com/profile_images/918144297077223426/U9UuwJW0_400x400.jpg"
      ),
    location: 'orta mahallesi',
    points: 8.8,
    delivery: true,
    );

  static var kus2 = UserClass(
      username: "hanife",
      name: "kuruPilav",
      profilePic: NetworkImage(
          "https://iasbh.tmgrup.com.tr/7e1161/650/344/0/0/343/180?u=https://isbh.tmgrup.com.tr/sbh/2020/03/04/sosyal-medyada-yogun-ilgi-goren-fatma-teyzeden-suriye-yorumu-1583311926224.jpg"
      ),
    location: 'orta mahallesi',
    points: 7.8,
    delivery: false,
    );

  static var kus3 = UserClass(
      username: "gozleme kralicesi",
      name: "boncuk",
      profilePic: NetworkImage(
          "https://fastly.4sqi.net/img/general/600x600/13760822_gKWpXAFUqtp9rkUr2BnKdt2m-G4sse_5vFDY0PweP1Y.jpg"
      ),
      location: 'orta mahallesi',
    points: 6,
    delivery: false,

  );

  var users = [ kus,kus2,kus3,kus,kus,kus];

  void buttonPressed() {
    setState(() {
      postCount += 1;
    });
  }

  void profilePage() {
    setState(() {
      Navigator.pushNamed(context, '/profile');

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Appcolors.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Column(
                children: users
                    .map((user) => UserCard(
                    user: user,
                    ))
                    .toList(),
              ),
              SizedBox(),
            ],
          ),
        ),

    );
  }
}
