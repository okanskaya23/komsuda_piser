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
  bool button_check = true;
  TextEditingController _editingController = new TextEditingController();
  final duplicatedItems = ["armut", "elma", "arm", "armt", "barbar",];
  var items = [];

  List<String> arr_t = [];
  List<String> arr_f = [];


  var total = 0;
  var EmailTeyze = "";

  @override
  void initState() {
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(button_check ? arr_t : arr_f);
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
        items.addAll(button_check ? arr_t : arr_f);
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
              Text(
                "Acıktın mı?",
                style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Appcolors.third,
                      height: 45,
                      onPressed: () async{
                          button_check = true;
                          var result = await firestoreInstance
                              .collection("User")
                              .get();

                          result.docs.forEach((res) {
                          arr_t.add(res.get("name"));
                          });
                          print(arr_t);
                      },
                      child: Text(
                        "Teyze Ara",
                        style: TextStyle(
                          color: Appcolors.background,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                 ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "veya",
                      style: TextStyle(
                        color: Appcolors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () async{
                          button_check = false;
                          var result = await firestoreInstance
                              .collection("Food")
                              .get();

                          result.docs.forEach((res) {
                            arr_f.add(res.get("Name"));

                          });
                          print(arr_f);
                        },
                        child: Text(
                          "Yemek Ara",
                          style: TextStyle(
                            color: Appcolors.third,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Appcolors.third),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
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
                          prefixIcon: Icon(Icons.search, color: Appcolors.secondary),
                          hintText: "Hakuna Matata...",
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none,),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none,),
                        ),
                        cursorColor: Colors.yellow,
                        onChanged: (value) async{
                          filterSearchResults(value);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery. of(context). size. height/2.7,
                  width: MediaQuery. of(context). size. width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if(button_check == true) {
                      return ListTile(
                      title: Text("${arr_t[index]}"),
                      onTap: () async{
                      //TODO: BURAYA TIKLAYINCA PROFILE PAGE'E GIDECEK
                      },
                      );
                      }
                      else if (button_check == false){
                      return ListTile(
                      title: Text("${arr_f[index]}"),
                      onTap: () async{
                      //TODO: BURAYA TIKLAYINCA PROFILE PAGE'E GIDECEK

                      },
                      );
                      }
                      else return Text("");
                      },
                      ),

                  ),
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
              Image.asset(
                "assets/images/kuru.jpg",
                height: MediaQuery.of(context).size.height * 0.65,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
