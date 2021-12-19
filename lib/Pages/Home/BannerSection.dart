import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/app_textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({
    Key key,
  }) : super(key: key);

  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final firestoreInstance = FirebaseFirestore.instance;

  TextEditingController _editingController = new TextEditingController();
  final duplicatedItems = ["armut", "elma", "3", "4"];
  var items = [];

  @override
  void initState() {
    items.addAll(duplicatedItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicatedItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicatedItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Text(
                "Look For A Meal",
                style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Live another day",
                style: TextStyle(
                  fontSize: 56,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "LOREM IPSUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),*/
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                child: Column(
                  children: <Widget>[
                    TextField(
                        controller: _editingController,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Appcolors.secondary),
                          hintText: "Search your favourite teyze",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        cursorColor: Colors.yellow,
                        onChanged: (value) {
                          filterSearchResults(value);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  if (_editingController == "") {
                    return Text("");
                  } else
                    return ListTile(
                      title: Text("Listedeki ${items[index]}"),
                      onTap: () {},
                    );
                },
              ),

              /*Row(
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
                          var us = await firestoreInstance
                              .collection("User")
                              .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
                              .get();
                          var Address = "";
                          Address = us.docs.first.get("address");
                          print(us.docs.first.get("address"));
                          var result = await firestoreInstance
                              .collection("Chart")
                              .where("Email_Client", isEqualTo: FirebaseAuth.instance.currentUser.email)
                              .get();
                          var arr = [];
                          var total = 0;
                          var EmailTeyze = "";

                          result.docs.forEach((res) {
                            total += res.get("Cost");
                            arr.add(res.get("Foods"));
                            EmailTeyze = res.get("Email_Teyze");


                          });
                          print(arr);
                          firestoreInstance.collection("Order").add(
                              {
                                "Email_Teyze" : EmailTeyze,
                                "Email_Client": FirebaseAuth.instance.currentUser.email,
                                "Foods" : arr,
                                "Price" : total,
                                "Adress" : Address,
                                "Date" : FieldValue.serverTimestamp(),

                              }
                          ).then((value){
                            print(value.id);
                          });
                          result.docs.forEach((res) {
                            firestoreInstance.collection("Chart").doc(res.id).delete();
                          });
                          */ /*setState(() {

                          });*/ /*
                        },

    */ /*{
                          var result = await firestoreInstance
                              .collection("User")
                              .where("zipCode", isEqualTo: "34000")
                              .get();
                          result.docs.forEach((res) {
                            print(res.data());
                          });
                        },*/ /*
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
              ),*/
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
              Image.asset(
                "assets/images/yemek2.png",
                height: MediaQuery.of(context).size.height * 0.65,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
