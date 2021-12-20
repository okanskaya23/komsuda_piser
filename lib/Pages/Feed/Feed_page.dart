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
  String zip = "34000";
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('User').where("email", isEqualTo:FirebaseAuth.instance.currentUser.email).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
              snapshot.data.docs.map((doc) {
                zip = doc.get("zipCode");
              }).toList();

              return StreamBuilder<QuerySnapshot>(
                stream: db.collection('User').where("zipCode", isEqualTo: zip).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
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
                            ordernum: doc.get('NumberOfOrder'),
                            profilePic: NetworkImage(
                                "${doc.get('pp')}"
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              );
          }
        },
      ),
    );
  }
}

