import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/objects/user_class.dart';

class UserCard extends StatelessWidget {

  final UserClass user;
  UserCard({ this.user });

  Color puan_rengi(double d){
    if( d > 8.5){
      return Colors.greenAccent;
    }else if(d > 7){
      return Colors.amber;
    }else if(d > 5){
      return Colors.redAccent;
    }
    return Colors.black;

  }

  String teslimat(bool b){
    if(b == true){
      return 'Var';
    }
    return 'Yok';
  }

  Color teslimat_rengi(bool b){
    if(b == true){
      return Colors.greenAccent;
    }
    return Appcolors.third;
  }

  void food_page(

      ){}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(25, 16.0, 25, 0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              onTap: () {
                print("click");
                //TODO: BURADA TIKLANILAN TEYZENIN PROFILINE GIDILMESI GEREK
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
                            image: user.profilePic,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: context.width * 0.05,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${user.username}",
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
                                Text("Puan: ${user.points} / 10",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: puan_rengi(user.points),
                                    letterSpacing: -1.5,
                                  ),
                                ),
                                VerticalDivider(color: Colors.black,),
                                SizedBox(width: context.width * 0.02,),
                                Text("Teslimat: ${teslimat(user.delivery)}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: teslimat_rengi(user.delivery),
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
                      Icon(Icons.location_on_outlined,color: Appcolors.third,),
                      SizedBox(width: 5,),
                      Text(
                        "${user.location}  ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.text,
                          letterSpacing: -1.5,
                        ),
                      ),
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