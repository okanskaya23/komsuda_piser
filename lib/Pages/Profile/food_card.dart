import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:komsuda_piser_local/Pages/Profile/profile_page.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/Utils/objects/food_class.dart';

class FoodCard extends StatelessWidget {

  final FoodClass food;
  FoodCard({ this.food });


  void add_to_cart(FoodClass f){
    //TODO:   BURADA ALISVERIS SEPETINE f ADINDA BIR FOOD CLASS EKLENMESI GEREK OBJECT
    //TODO:     ADLI DOSYADAN BAKABILIRSINIZ FOODCLASSIN NE OLDUGUNA.
  }

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
              onTap: () {
                add_to_cart(food);
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