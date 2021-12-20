import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;

    return Row(
      children: <Widget>[

        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Text(
                "Komşuda Pişti",
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Size de düştü",
                style: TextStyle(
                  fontSize: 56,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Afiyet Olsun",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.3))),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.adjust_rounded,
                        color: Appcolors.secondary),
                    hintText: "Favori komşunuzu arayın",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Appcolors.secondary,
                      height: 55,
                      onPressed: () {
                        firestoreInstance.collection("User").get().then((querySnapshot) {
                          querySnapshot.docs.forEach((result) {
                            print(result.data());
                          });
                        });
                      },
                      child: Text(
                        "Delivery",
                        style: TextStyle(color: Appcolors.primary),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Appcolors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async{
                          var result = await firestoreInstance
                              .collection("User")
                              .where("zipCode", isEqualTo: "34000")
                              .get();
                          result.docs.forEach((res) {
                            print(res.data());
                          });
                        },
                        child: Text(
                          "Pick Up",
                          style: TextStyle(
                            color: Appcolors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Appcolors.secondary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/kuru.jpg"),
            ],
          ),
        ),
      ],
    );
  }
}