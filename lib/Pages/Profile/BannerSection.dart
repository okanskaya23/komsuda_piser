import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Text(
                "Look For A Meal",
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold),
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
                    hintText: "Search your favourite teyze",
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
                      onPressed: () {},
                      child: Text(
                        "Delivery",
                        style: TextStyle(color: Colors.white),
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
                        color: Appcolors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Pick Up",
                          style: TextStyle(
                            color: Appcolors.secondary,
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
              Image.asset("assets/images/yemek.png"),
            ],
          ),
        ),
      ],
    );
  }
}