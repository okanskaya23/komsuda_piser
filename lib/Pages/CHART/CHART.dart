import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class chart extends StatefulWidget {
  @override
  Chart createState() => Chart();

}

class Chart extends State<chart> {
  final db = FirebaseFirestore.instance;

  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
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
                    height: MediaQuery. of(context). size. height/3,
                    width: MediaQuery. of(context). size. width,
                  ),
                  SizedBox(height: context.height*0.1,),
                  Divider(),
                  SizedBox(height: context.height*0.02,),
                  AppButton(
                    text: 'Give Order',
                    onPressed: () async{
                      var result = await firestoreInstance
                          .collection("Chart")
                          .where("Email_Client", isEqualTo: FirebaseAuth.instance.currentUser.email)
                          .get();
                      var arr = [];
                      result.docs.forEach((res) {
                        var b = res.data().values.toList();
                        for(var i in b){
                          if(i.toString().contains("@")){
                            print(i);
                          }
                          else{
                            arr.add(i);
                          }
                        }
                      });
                      print(arr);
                      firestoreInstance.collection("Order").add(
                          {
                            "Email_Teyze" : "kısırlarınefendisi@gmail.com",
                            "Email_Client": FirebaseAuth.instance.currentUser.email,
                            "Foods" : arr,
                            "Price" : "107",
                            "Adress" : "Sabanci Universitesi B7",

                          }
                          ).then((value){
                        print(value.id);
                      });
                      result.docs.forEach((res) {
                        firestoreInstance.collection("Chart").doc(res.id).delete();
                      });
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