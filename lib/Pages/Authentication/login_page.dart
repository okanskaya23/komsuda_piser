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

class login extends StatefulWidget {
  @override
  Login createState() => Login();
}
//Todo buray hata mesajları
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
            color: Appcolors.primary,
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
                          image: AssetImage(
                              'assets/images/pot.png'
                          ),
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
                          validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                          readOnly: false,
                          height: MediaQuery. of(context). size. height/18,
                          icon: Icon(Icons.mail_outlined),
                          controller: emailController,
                        ),
                        SizedBox(height: context.height*0.01,),

                        AppTextField(
                          text: 'Şifre',
                          readOnly: false,
                          height: MediaQuery. of(context). size. height/18,
                          icon: Icon(Icons.lock_outline),
                          obscureText: true,
                          controller: passwordController,
                        ),
                        SizedBox(height: context.height*0.01,),


                        AppButton(
                          borderColor: Appcolors.third,
                          text: 'Giriş Yap',
                          onPressed: () async{
                            try {
                              await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                              Navigator.pushNamed(context, '/');
                            } on FirebaseAuthException catch (e) {
                              print(e.message);

                            }
                            setState(() {
                            });
                          },
                          height: MediaQuery. of(context). size. height/18,
                          width: MediaQuery. of(context). size. width*0.5,
                        ),


                        SizedBox(height: context.height*0.005,),
                        buildRowTexts(context),
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

  Row buildRowTexts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: 'Hesabınız yok mu?  ',
              style: h2,
              children: <TextSpan>[
                TextSpan(
                    text: 'Kayıt Olun.',
                    style: h2_clickable,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, '/signup')),
              ],
           ),
        ),

        RichText(
          text: TextSpan(
              text: 'Şifrenizi mi unuttunuz?',
              style: h2_clickable,
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/forgot')),
        ),
      ],
    );
  }


  Row buildRowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          borderColor: Appcolors.third,
          text: 'Giriş Yap',
          onPressed: () async{
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
              Navigator.pushNamed(context, '/home');
            } on FirebaseAuthException catch (e) {
              print(e.message);

            }
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
