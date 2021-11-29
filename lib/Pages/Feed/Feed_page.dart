import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class feed extends StatefulWidget {
  @override
  Feed createState() => Feed();
}

class Feed extends State<feed> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  final firestoreInstance = FirebaseFirestore.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.background,

      body: SingleChildScrollView(
          child: Container(
            color: Appcolors.background,
            height: MediaQuery. of(context). size. height,
            width: MediaQuery. of(context). size. width,
            child: Padding(
              padding: context.paddingNormal,
              child: Column(
                children: [

                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Container(
                      height: MediaQuery. of(context). size. height * 0.25,
                      width: MediaQuery. of(context). size. width   * 0.25,
                      child: FittedBox(
                        child: Image(
                          image: AssetImage('assets/images/pot.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(


                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child:Text(
                            'The Feed Page ',
                            style: h1,

                          ),
                        ),


                        Divider(),

                        SizedBox(height: context.height * 0.02,),


                        SizedBox(height: context.height*0.01,),
                        buildRowButtons(context),
                        SizedBox(height: context.height*0.005,),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),
      ),
      );
  }
  Row buildRowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          borderColor: Appcolors.third,
          text: 'Kontrol et',
          onPressed: () async{
            firestoreInstance.collection("User").add(
                {
                  "name" : "utku",
                  "age" : 13443,
                  "email" : "1231234@exa1234123mple.com",
                  "address" : {
                    "street" : "123413241234 24",
                    "city" : "1234123412341234123 york"
                  }
                }).then((value){
              print(value.id);
            });

            var user = FirebaseAuth.instance.authStateChanges().listen((user) {
              if (user == null) {
                print('User is currently signed out!');
              } else {
                print('User is signed in!\nUsername: ${user}');
              }
            });
            setState(() {
            });
          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.22,
        ),


        AppButton(
          borderColor: Appcolors.third,
          text: 'Çıkış Yap',
          onPressed: () async{
            await FirebaseAuth.instance.signOut(

            );
            Navigator.pushNamed(context, '/login');
            setState(() {
            });
          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.22,
        ),
      ],
    );
  }

}
