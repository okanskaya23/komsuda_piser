/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/users.dart';
//import 'package:travel_budget/widgets/provider_widget.dart';
import 'package:komsuda_piser_local/cards.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';



class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = User.fromSnapshot(tripSnapshot).username;

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersSnapshots() async {/*
    final uid = await Provider.of(context).auth.getCurrentUID();
    var data = await Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('trips')
        .where("endDate", isLessThanOrEqualTo: DateTime.now())
        .orderBy('endDate')
        .getDocuments();
    setState(() {
      _allResults = data.documents;
    });
    searchResultsList();
    return "complete";*/
  }

  Widget userCard(BuildContext context, int index) {
    final List<User> userList = [
      User("Ayşe Teyze", 7.0, 62),
      User("Hanife Nine", 9.0, 14),
      User("Fatma Abla", 8.0, 140),
    ];
    final users = userList[index];
    return new Container(
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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Past Trips", style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder: (BuildContext context, int index) =>
                    userCard(context, _resultsList[index]),
              )

          ),
        ],
      ),
    );
  }
}

 */