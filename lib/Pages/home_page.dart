import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_auth_service.dart';
import 'package:komsuda_piser_local/Utils/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';

class home extends StatefulWidget {
  @override
  Home createState() => Home();
}

class Home extends State<home> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
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
              child: Image(
                image: AssetImage('assets/images/yemek.png'),
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
                        Center(
                          child:Text(
                            'You Are Logged in! ',
                            style: h1,

                          ),
                        ),


                        Divider(),

                        SizedBox(height: context.height * 0.02,),


                        SizedBox(height: context.height*0.01,),


                        AppButton(
                          borderColor: Appcolors.third,
                          text: 'Çıkış Yap',

                          onPressed: () async{
                            _signOut();
                            Navigator.pushNamed(context, '/login');
                            setState(() {
                            });
                          },
                          height: MediaQuery. of(context). size. height/18,
                          width: MediaQuery. of(context). size. width*0.22,
                        ),

                        SizedBox(height: context.height*0.005,),
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
