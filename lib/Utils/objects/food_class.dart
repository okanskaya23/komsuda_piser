import 'package:flutter/cupertino.dart';

class FoodClass {
  String name;
  double price;
  NetworkImage picture;
  String cook_mail;
  int remaining;

  FoodClass({
    this.name,
    this.price,
    this.picture,
    this.cook_mail,
    this.remaining,
  });
}