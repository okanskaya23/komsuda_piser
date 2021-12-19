import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:komsuda_piser_local/Pages/Profile/profile_page.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/objects/food_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FoodCard extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;

  final FoodClass food;
  FoodCard({ this.food });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(25, 8.0, 25, 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              onTap: () async{
                var flag = true;
                var result = await firestoreInstance
                    .collection("Chart")
                    .where("Email_Client", isEqualTo: FirebaseAuth.instance.currentUser.email)
                    .get();
                var EmailTeyze = "";
                var firstTeyze = food.cook_mail;

                if(result.size > 1){
                  result.docs.forEach((res) {
                    EmailTeyze = res.get("Email_Teyze");
                    print("aaaaaaaaaaaa");
                    print(EmailTeyze);
                    if (EmailTeyze != firstTeyze) {
                      flag = false;
                      //TODO hata meesajı lazım
                    }
                  });
                }
                if(flag){
                  firestoreInstance.collection("Chart").add({
                    "Email_Teyze": food.cook_mail,
                    "Email_Client": FirebaseAuth.instance.currentUser.email,
                    "Foods": food.name,
                    "Cost": food.price,
                  }).then((value) {
                    print(value.id);
                  });
                }
              },
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        Container(
                          color: Appcolors.primary,
                          height: context.height * 0.12,
                          width: context.height * 0.12,
                          child: Image(
                            image: food.picture,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: context.width * 0.05,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${food.name}",
                              style: TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.text,
                                letterSpacing: -1.5,
                              ),
                            ),
                            SizedBox(height: context.height * 0.02,),
                            Row(
                              children: [
                                Text("Kalan: ${food.remaining} porsyon",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Appcolors.primary,
                                    letterSpacing: -1.5,
                                  ),
                                ),
                                VerticalDivider(color: Colors.black,),
                                SizedBox(width: context.width * 0.02,),
                                Text("Fiyat: ${food.price} ₺",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: Appcolors.primary,
                                    letterSpacing: -1.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        Icon(Icons.add, color: Appcolors.third,),
                        SizedBox(width: 5,),
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}