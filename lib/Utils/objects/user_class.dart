import 'package:flutter/cupertino.dart';

class UserClass {
  String username;
  String name;
  String location;
  NetworkImage profilePic;
  String email;
  int ordernum;
  double points;
  bool delivery;

  UserClass({ this.username, this.ordernum, this.name, this.location, this.profilePic, this.email, this.delivery,this.points});
}