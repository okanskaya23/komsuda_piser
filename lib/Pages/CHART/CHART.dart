import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO agalar buraya sipariş tutarı ve çıkartma eklenecek

class chart extends StatefulWidget {
  @override
  Chart createState() => Chart();

}

class Chart extends State<chart> {
  final db = FirebaseFirestore.instance;

  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  bool VISIB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.primary,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Container(
              color: Appcolors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: db.collection('Chart').where("Email_Client", isEqualTo: FirebaseAuth.instance.currentUser.email).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Empty Cart"),
                          );
                        } else {
                          return ListView(
                            children: snapshot.data.docs.map((doc) {
                              return Card(
                                child: ListTile(
                                  leading:
                                      Icon(Icons.add_shopping_cart_rounded),
                                  title: Text(doc.get("Foods").toString()),
                                  onTap: () async {
                                    var result = await firestoreInstance
                                        .collection("Chart")
                                        .where("Email_Client",
                                            isEqualTo: FirebaseAuth
                                                .instance.currentUser.email)
                                        .where("Foods",
                                            isEqualTo:
                                                doc.get("Foods").toString())
                                        .get();
                                    firestoreInstance
                                        .collection("Chart")
                                        .doc(result.docs.first.id)
                                        .delete();
                                  },
                                  subtitle: Text(doc.get("Cost").toString()),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                    height: MediaQuery. of(context). size. height/3,
                    width: MediaQuery. of(context). size. width,
                  ),
                  SizedBox(height: context.height*0.1,),
                  Divider(),
                  SizedBox(height: context.height*0.02,),
                  AppButton(
                    text: 'Give Order',
                    onPressed: () async{
                      var us = await firestoreInstance
                          .collection("User")
                          .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
                          .get();
                      var Address = "";
                      Address = us.docs.first.get("address");
                      print(us.docs.first.get("address"));
                      var result = await firestoreInstance
                          .collection("Chart")
                          .where("Email_Client", isEqualTo: FirebaseAuth.instance.currentUser.email)
                          .get();
                      var arr = [];
                      var total = 0;
                      var EmailTeyze = "";

                      result.docs.forEach((res) {
                        total += res.get("Cost");
                        arr.add(res.get("Foods"));
                        EmailTeyze = res.get("Email_Teyze");


                      });
                      print(arr);
                      firestoreInstance.collection("Order").add(
                          {
                            "Email_Teyze" : EmailTeyze,
                            "Email_Client": FirebaseAuth.instance.currentUser.email,
                            "Foods" : arr,
                            "Price" : total,
                            "Adress" : Address,
                            "Date" : FieldValue.serverTimestamp(),

                          }
                      ).then((value){
                        print(value.id);
                      });
                      result.docs.forEach((res) {
                        firestoreInstance.collection("Chart").doc(res.id).delete();
                      });
                      var result12 = await firestoreInstance
                          .collection("User")
                          .where("email", isEqualTo: EmailTeyze)
                          .get();
                      var current = result12.docs.first.id;

                      await FirebaseFirestore.instance.collection("User").doc(current).update({"NumberOfOrder": FieldValue.increment(1)});
                      setState(() {

                      });
                    },
                    height: MediaQuery. of(context). size. height/18,
                    width: MediaQuery. of(context). size. width,
                  ),
                  SizedBox(height: context.height*0.01,),
                  SizedBox(height: 50),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}