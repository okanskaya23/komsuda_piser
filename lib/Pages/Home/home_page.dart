import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:kartal/kartal.dart';
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

      body:
          SingleChildScrollView(
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
                              'The Home Page',
                              style: h1,

                            ),
                          ),


                          Divider(),

                          SizedBox(height: context.height * 0.02,),


                          SizedBox(height: context.height*0.01,),
                          buildRowButtons(context),

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
