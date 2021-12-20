import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Profile/food_card.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/objects/food_class.dart';
import 'package:komsuda_piser_local/Utils/objects/user_class.dart';



class ownProfilePage extends StatefulWidget {
  final UserClass user;

  ownProfilePage({Key key, this.title,
    this.user
  }) : super(key: key);

  final String title;

  @override
  OwnProfilePage createState() => OwnProfilePage();
}

class OwnProfilePage extends State<ownProfilePage> {
  @override
  final db = FirebaseFirestore.instance;




  Widget build(BuildContext context) {
//TODO: BURADAKI USER INSTANCESINI DA EMAIL KULLANARAK ALMAMIZ VE DISPLAY ETMEMIZ GEREK
    UserClass _user = widget.user ?? UserClass(
        name: 'ayse',
        location: '34560',
        username: 'ayse',
        ordernum: 2,
        points: 6,
        profilePic: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/c/c9/CZN_Burak_and_Ramço_%28cropped%29.png"
        ),
        delivery: false
    );
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    String delivery_option(bool b){
      if(b)
        return "var";
      return "yok";
    }

    Color delivery_color(bool b){
      if(b)
        return Colors.greenAccent;
      return Colors.redAccent;
    }


    Color score_color(double d){

      if(d > 3.7){
        return Colors.greenAccent;
      }else if(d > 3){
        return Colors.amber;
      }else if(d > 2){
        return Colors.redAccent;
      }
      return Colors.red[900];
    }


    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('User').where("email", isEqualTo:FirebaseAuth.instance.currentUser.email).snapshots(),
              // ignore: missing_return
              builder: (context, snapshot) {

                if (snapshot.hasError) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else{
                  snapshot.data.docs.map((doc){
                    _user.name = doc.get('name');
                    _user.email = doc.get('email');
                    _user.username = doc.get('name');
                    _user.points = doc.get('score');
                    _user.delivery = doc.get('delivery');
                    _user.ordernum = doc.get('NumberOfOrder');
                    _user.profilePic = NetworkImage("${doc.get('pp')}");
                  }).toList();

                  return Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Appcolors.secondary,
                                Appcolors.third,
                              ]
                          )
                      ),
                      width: width * 0.33,
                      height:MediaQuery.of(context).size.height *0.8,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: _user.profilePic,
                              radius: 50.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "${_user.name}",
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
                                            "Teslimat",
                                            style: TextStyle(
                                              color: Appcolors.third,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "${delivery_option(_user.delivery)}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: delivery_color(_user.delivery),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Puan",
                                            style: TextStyle(
                                              color: Appcolors.third,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "${(_user.points / _user.ordernum).toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: score_color(_user.points / _user.ordernum),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),

          Expanded(
            flex: 2,
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('Food').where("Cook", isEqualTo:FirebaseAuth.instance.currentUser.email).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else{
                  return ListView(
                    children: snapshot.data.docs.map((doc){
                      return FoodCard(
                        food: FoodClass(
                          cook_mail: doc.get('Cook'),
                          price: doc.get('Price'),
                          name: doc.get('Name'),
                          remaining: doc.get('Remaining'),
                          picture: NetworkImage(
                              "${doc.get('Picture')}"
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
