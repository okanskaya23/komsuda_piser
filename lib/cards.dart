import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';
import 'package:komsuda_piser_local/users.dart';

class UserCards extends StatelessWidget {
  final List<User> userList = [
    User("Ayşe Teyze", 7.0, 62),
    User("Hanife Nine", 9.0, 14),
    User("Fatma Abla", 8.0, 140),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: /*new*/ ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) =>
              userCard(context, index)),
    );
  }

  Widget userCard(BuildContext context, int index) {
    final users = userList[index];
    return /*new*/ Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(
                    "${users.username}/10",
                    style: /*new*/ TextStyle(fontSize: 30.0),
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Go to Profile",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Appcolors.secondary),
                    ),
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Text("${users.rating.toString()}/10",
                      style: /*new*/ TextStyle(fontSize: 35.0)),
                  Spacer(),
                  Icon(Icons.thumb_up),
                  Text("${users.reputation.toString()}",
                      style: /*new*/ TextStyle(fontSize: 15.0)),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
