import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:komsuda_piser_local/Pages/CHART/CHART.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class chart extends StatefulWidget {
  @override
  Chart createState() => Chart();
}

class Chart extends State<chart> {
  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();
  var zipCodeController = TextEditingController();
  var DevlivryTypeController = TextEditingController();
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
                  SizedBox(height: context.height*0.1,),
                  Divider(),

                  SizedBox(height: context.height*0.02,),

                  Text(
                    'Yemek Ekleyin .',
                    style: h2,
                  ),

                  SizedBox(height: context.height*0.01,),



                  AppButton(
                    text: 'Give Order',
                    onPressed: () async{
                      firestoreInstance.collection("Order").add(
                          {
                            "Email_teyze" : "kısırlarınefendisi@gmail.com",
                            "Foods" : "Kuru_Pilav,Cacık ",
                            "Price" : "107",
                            "Adress" : "Sabanci Universitesi B7",

                          }).then((value){
                        print(value.id);
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