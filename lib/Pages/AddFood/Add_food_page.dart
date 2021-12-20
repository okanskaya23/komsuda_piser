import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class settings extends StatefulWidget {
  @override
  Settings createState() => Settings();
}

class Settings extends State<settings> {
  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();
  var ppURLController = TextEditingController();
  var numberOfServesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [


            Container(

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

                  AppTextField(
                    text: 'Yemek Adı',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.person_outline),
                    controller: usernameController,
                  ),
                  SizedBox(height: context.height*0.01,),



                  AppTextField(
                    text: 'Yemek Fiyatı',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(FontAwesomeIcons.moneyBill),
                    controller: passwordController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'Yemek Resmi',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.fastfood),
                    controller: ppURLController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'Porsyon Sayısı',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.confirmation_number_rounded),
                    controller: numberOfServesController,
                  ),
                  SizedBox(height: context.height*0.01,),


                  AppButton(
                    text: 'Yemek Ekle',
                    onPressed: () async{
                      firestoreInstance.collection("Food").add(
                          {
                            "Name" : usernameController.text,
                            "Cook" : FirebaseAuth.instance.currentUser.email,
                            "Price": double.parse(passwordController.text),
                            "Picture" : ppURLController.text,
                            "Remaining": int.parse(numberOfServesController.text),
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
