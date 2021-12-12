import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';

class forgot extends StatefulWidget {
  @override
  Forgot createState() => Forgot();
}

class Forgot extends State<forgot> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.background,
      body: Row(
        children:[
          Container(
            height: MediaQuery. of(context). size. height,
            width: MediaQuery. of(context). size. width * 0.5,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: AssetImage('assets/images/yemek2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Appcolors.primary,
            height: MediaQuery. of(context). size. height,
            width: MediaQuery. of(context). size. width * 0.5,
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

                    color: Appcolors.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: context.height * 0.05,),
                        Text(
                          'Şifre sıfırlamak için lütfen mailinizi giriniz.',
                          style: h2,
                        ),
                        Divider(),




                        SizedBox(height: context.height*0.01,),

                        AppTextField(
                          text: 'E-Posta',
                          readOnly: false,
                          height: MediaQuery. of(context). size. height/18,
                          icon: Icon(Icons.mail_outlined),
                          controller: emailController,
                        ),
                        SizedBox(height: context.height*0.01,),



                        AppButton(
                          borderColor: Appcolors.third,
                          text: 'Kod Gönder',
                          onPressed: () async{
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text.trim(),
                            );
                            setState(() {
                            });
                          },
                          height: MediaQuery. of(context). size. height/18,
                          width: MediaQuery. of(context). size. width*0.5,
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }

}
