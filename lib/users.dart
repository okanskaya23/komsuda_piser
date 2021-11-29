import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  String username;
  double rating;
  double reputation;


  User(
      this.username,
      this.rating,
      this.reputation
      );

  // formatting for upload to Firebase when creating the trip
  Map<String, dynamic> toJson() => {
    'username': username,
    'rating': rating,
  };

  // creating a Trip object from a firebase snapshot
  User.fromSnapshot(DocumentSnapshot snapshot) :
        username = snapshot['username'],
        rating = snapshot['rating'],
        reputation = snapshot['reputation'];


/*
  Map<String, Icon> types() => {
    "car": Icon(Icons.directions_car, size: 50),
    "bus": Icon(Icons.directions_bus, size: 50),
    "train": Icon(Icons.train, size: 50),
    "plane": Icon(Icons.airplanemode_active, size: 50),
    "ship": Icon(Icons.directions_boat, size: 50),
    "other": Icon(Icons.directions, size: 50),
  };
  */

}