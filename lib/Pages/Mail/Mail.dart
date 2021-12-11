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


class mail extends StatefulWidget {
  @override
  Mail createState() => Mail();
}

class Mail extends State<mail> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bu Sayfa kısırlarınefendisi@gmail.com gelmiş her orderı gösteriyor emaili usera bağlayınca doğru kullanıcalar için gösterecek"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Order').where("Email_teyze", isEqualTo: "kısırlarınefendisi@gmail.com").snapshots(),
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