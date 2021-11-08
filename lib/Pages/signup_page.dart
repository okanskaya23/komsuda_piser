import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';


class signup extends StatefulWidget {
  @override
  Signup createState() => Signup();
}

class Signup extends State<signup> {
  var eMailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();
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
                    'Hoş geldiniz, Kayıt olmak için bilgilerinizi giriniz.',
                    style: h2,
                  ),

                  SizedBox(height: context.height*0.01,),

                  AppTextField(
                    text: 'kullanıcı adı',
                    readOnly: false,
                    height: 50,
                    icon: Icon(Icons.person_outline),
                    controller: eMailController,
                  ),
                  SizedBox(height: context.height*0.01,),

                  AppTextField(
                    text: 'E-Posta',
                    readOnly: false,
                    height: 50,
                    icon: Icon(Icons.mail_outlined),
                    controller: eMailController,
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
                  AppTextField(
                    text: 'Şifre (tekrar)',
                    readOnly: false,
                    height: 50,
                    icon: Icon(Icons.lock_outline),
                    obscureText: true,
                    controller: passwordCheckController,
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
    );
  }

  Row buildRowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          text: 'Kayıt Ol',

          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.46,
        ),


        AppButton(
          borderColor: Appcolors.third,
          text: 'Giriş Yap',
          onPressed: () async {
            print("mail : ${passwordController.text}\npassword : ${passwordController.text}");

            //TODO: burda kullanici adi sifreyi backende baglayacagiz.

          },
          height: MediaQuery. of(context). size. height/18,
          width: MediaQuery. of(context). size. width*0.46,
        ),
      ],
    );
  }
}
