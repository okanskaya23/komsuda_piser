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
  void buttonPressed() {
    if (TC == "Email_Client") {
      setState(() {
        TC = "Email_Teyze";
      });
    }
    else {
      setState(() {
        TC = "Email_Client";
      });
    }
  }

  final db = FirebaseFirestore.instance;
  double rating = 0.0; //BU GLOBAL VARIABLE OLMAYACAK, DATABASE'DEN GELECEK
  String buttonName = "Gelen Sipariş";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondary,
        automaticallyImplyLeading: false,
        title: AppButton(
          text: buttonName,
          onPressed: buttonPressed,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Order').where(
            TC, isEqualTo: FirebaseAuth.instance.currentUser.email)
            .limit(10)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (TC == "Email_Client") {
            buttonName = "Gelen Sipariş";
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            doc.get("Foods").toString()
                        ),
                        // EMAIL TEYZE YERINE KULLANICI ADI GELEBİLİR Mİ?
                        //Text(doc.get("Cost").toString()),
                        Container(
                          child: RatingBar.builder(
                            minRating: 1,
                            updateOnDrag: true,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2),
                            itemBuilder: (context, _) =>
                                Icon(Icons.star, color: Colors.amber,),
                            onRatingUpdate: (rating) =>
                                setState(() {
                                  buttonName = "Siparişlerim";
                                  this.rating = rating;
                                  //TODO: BACKEND KISMI BURAYA
                                }),
                          ),
                        ),
                        AppButton(
                          text: "Rate",
                          onPressed:() async{

                            var rate = rating;
                            var email = doc.get("Email_Teyze").toString();
                            var result = await db
                                .collection("User")
                                .where("email", isEqualTo: email)
                                .get();
                            var current = result.docs.first.id;
                            await FirebaseFirestore.instance.collection("User").doc(current).update({"score": FieldValue.increment(rating)});
                            FirebaseFirestore.instance.collection("Order").doc(doc.id).delete();



                          },
                        ),
                        /*Text(
                          "Rate user: ${rating}",
                          style: TextStyle(fontSize: 15),
                        ),*/
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
          else {
            buttonName = "Siparişlerim";

            return  Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('Order').where(TC, isEqualTo: FirebaseAuth.instance.currentUser.email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Empty Chart"),
                    );
                  } else {
                    return ListView(
                      children: snapshot.data.docs.map((doc) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.white,
                            leading:
                            Icon(Icons.add_alert_rounded),
                            title: Text("Incoming order list: ${doc.get("Foods").toString()}, "
                                "from: ${doc.get("Email_Client").toString()}, "
                                "delivery address: ${doc.get("Adress").toString()}"),
                            onTap: () async {
                              /*var result = await db
                                  .collection("Chart")
                                  .where("Email_Client",
                                  isEqualTo: FirebaseAuth
                                      .instance.currentUser.email)
                                  .where("Foods",
                                  isEqualTo:
                                  doc.get("Foods").toString())
                                  .get();
                              db
                                  .collection("Chart")
                                  .doc(result.docs.first.id)
                                  .delete();*/
                            },
                            subtitle: Text("Total amount: ${doc.get("Price").toString()}₺"),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
              height: MediaQuery. of(context). size. height/3,
              width: MediaQuery. of(context). size. width,
            );
          }
        },
      ),

    );
  }
}