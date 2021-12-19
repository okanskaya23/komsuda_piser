import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO burda orderlamayı deneyince bi infinite loop oluyor onabi ara bakalım birde burda tab yapaısı yapsak tıklayınca senin verdiğin siparişler ve sana gelen siparaişler arsında geçiş yapalım
var TC = "Email_Teyze";

class mail extends StatefulWidget {
  @override
  Mail createState() => Mail();

}

class Mail extends State<mail> {
  void buttonPressed(){
      if(TC == "Email_Client"){
        TC = "Email_Teyze";
      }
      else{
        TC = "Email_Client";
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => super.widget
          ));


  }
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppButton(

          text: "okan kasar",
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
                return Card(
                  child: ListTile(
                    title: Text(doc.data().toString()),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}