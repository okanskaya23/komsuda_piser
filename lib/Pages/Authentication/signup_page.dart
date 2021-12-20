import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_button.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/Widgets/app_textField.dart';
import 'package:kartal/kartal.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class signup extends StatefulWidget {
  @override
  Signup createState() => Signup();
}
// TODO buraya boş olursa gitmemesini eklemek lazım
class Signup extends State<signup> {
  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();
  var zipCodeController = TextEditingController();
  var ppCodeController = TextEditingController();
  var deliveryController = TextEditingController();
  var AddressController = TextEditingController();

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
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.person_outline),
                    controller: usernameController,
                  ),
                  SizedBox(height: context.height*0.01,),

                  AppTextField(
                    text: 'E-Posta',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.mail_outlined),
                    controller: emailController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'ZipCode',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.add_location_alt_sharp),
                    controller: zipCodeController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'Address',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.add_location_alt_sharp),
                    controller: AddressController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'Profile Picture URL',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.account_circle_rounded),
                    controller: ppCodeController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppTextField(
                    text: 'delivery Type',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.cases),
                    controller: deliveryController,
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
                  AppTextField(
                    text: 'Şifre (tekrar)',
                    readOnly: false,
                    height: MediaQuery. of(context). size. height/18,
                    icon: Icon(Icons.lock_outline),
                    obscureText: true,
                    controller: passwordCheckController,
                  ),
                  SizedBox(height: context.height*0.01,),
                  AppButton(
                    text: 'Kayıt Ol',
                    onPressed: () async{
                      firestoreInstance.collection("User").add(
                          {
                            "name" : usernameController.text,
                            "email" : emailController.text,
                            "pp": ppCodeController.text,
                            "zipCode": zipCodeController.text,
                            "score": "5",
                            "delivery": deliveryController.text,
                            "address" : AddressController.text,
                            "NumberOfOrder": 1,


                          }).then((value){
                        print(value.id);
                      });
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      setState(() {
                      });
                    },
                    height: MediaQuery. of(context). size. height/18,
                    width: MediaQuery. of(context). size. width,
                  ),
                  SizedBox(height: context.height*0.01,),
                  buildRowTexts(context),
                  SizedBox(height: 50),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowTexts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: 'Hesabınız var mı?  ',
            style: h2,
            children: <TextSpan>[
              TextSpan(
                  text: 'Giriş Yapın.',
                  style: h2_clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(context, '/login')),
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
