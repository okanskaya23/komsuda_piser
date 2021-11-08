import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_auth_service.dart';
import 'package:komsuda_piser_local/Utils/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';

class login extends StatefulWidget {
  @override
  Login createState() => Login();
}

class Login extends State<login> {
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
                        Center(
                          child:Text(
                            'Komşuda Pişer',
                            style: h1,

                          ),
                        ),
                        SizedBox(height: context.height * 0.005,),
                        Center(
                          child:Text(
                            'Size de Düşer',
                            style: h2,

                          ),
                        ),
                        Divider(),

                        SizedBox(height: context.height * 0.02,),

                        Text(
                          'Hoş geldiniz, Lütfen giriş yapınız.',
                          style: h2,
                        ),

                        SizedBox(height: context.height*0.01,),

                        AppTextField(
                          text: 'E-Posta',
                          readOnly: false,
                          height: 50,
                          icon: Icon(Icons.mail_outlined),
                          controller: emailController,
                        ),
                        SizedBox(height: context.height*0.01,),

                        AppTextField(
                          text: 'Şifre',
                          readOnly: false,
                          height: 50,
                          icon: Icon(Icons.lock_outline),
                          obscureText: true,
                          controller: passwordController,
                        ),
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
        ],
      ),
    );
  }

  Row buildRowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          text: 'Kayıt Ol',
          onPressed: () async{
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
            );
            setState(() {
            });
          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.2,
        ),


        AppButton(
          borderColor: Appcolors.third,
          text: 'Giriş Yap',
          onPressed: () async{
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            setState(() {
            });
          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.2,
        ),
      ],
    );
  }
}
