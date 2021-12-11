import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Feed/User_card.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:komsuda_piser_local/Utils/objects/user_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class feed extends StatefulWidget {

  @override
  Feed createState() => Feed();
}

class Feed extends State<feed> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bu Sayfa zip kodu 34000 olan çevredeki ateşli milfleri gösteriyor."),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('User').where("zipCode", isEqualTo: "34000").snapshots(),
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