import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


//TODO burda orderlamayı deneyince bi infinite loop oluyor onabi ara bakalım birde burda tab yapaısı yapsak tıklayınca senin verdiğin siparişler ve sana gelen siparaişler arsında geçiş yapalım
var TC = "Email_Teyze";

class mail extends StatefulWidget {
  @override
  Mail createState() => Mail();

}

class Mail extends State<mail> {
  void buttonPressed(){
      if(TC == "Email_Client"){
        setState(() {
          TC = "Email_Teyze";
        });
      }
      else{
        setState(() {
          TC = "Email_Client";
        });
      }

  }
  final db = FirebaseFirestore.instance;
  double rating = 0.0; //BU GLOBAL VARIABLE OLMAYACAK, DATABASE'DEN GELECEK

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: AppButton(

          text: "Change",
          onPressed: buttonPressed,
        ),
        centerTitle: true
        ,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Order').where(TC, isEqualTo: FirebaseAuth.instance.currentUser.email).limit(10).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(doc.get("Email_Teyze").toString()), // EMAIL TEYZE YERINE KULLANICI ADI GELEBİLİR Mİ?
                      //Text(doc.get("Cost").toString()),
                      Container(
                        child: RatingBar.builder(
                          minRating: 1,
                          updateOnDrag: true,
                          itemSize: 20,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                          onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                            //TODO: BACKEND KISMI BURAYA
                          }),
                        ),
                      ),
                      AppButton(
                        text: "Rate",
                        onPressed: () {},
                      ),
                      /*Text(
                        "Rate user: ${rating}",
                        style: TextStyle(fontSize: 15),
                      ),*/
                    ],
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}