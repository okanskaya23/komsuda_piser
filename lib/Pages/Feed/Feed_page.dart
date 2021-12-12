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
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('User').where("zipCode", isEqualTo: "34000").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else{
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return UserCard(
                  user: UserClass(
                    location: doc.get('zipCode'),
                    email: doc.get('email'),
                    points: doc.get('score'),
                    name: doc.get('name'),
                    username: doc.get('name'),
                    delivery: doc.get('delivery'),
                    profilePic: NetworkImage(
                        "${doc.get('pp')}"
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}