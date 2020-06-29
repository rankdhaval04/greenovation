import 'package:flutter/material.dart';
import 'package:greenovation/pages/profilrPage.dart';

import 'history.dart';
import 'joinCommunity.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int selectedIndex = 0;
  List<String> name = new List();
  List<String> date = new List();
  List<String> use = new List();

  @override
  void initState() {
    setState(() {
      name = ['Butterflies India','Childline India'];
      date = ['22/05/2020','03/05/2018'];
      use = ['Tree plantation','Animal wellfare'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('Donation')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), title: Text('Join Community')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.green,
        showUnselectedLabels: false,
        onTap: onItemTapped,
      ),
      body: ListView.builder(itemCount: name.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.0,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(name[index],style: Theme.of(context).textTheme.title.copyWith(color: Colors.green),)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(date[index],style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),)),
                            ),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(use[index],style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.green,
                                    child: MaterialButton(
                                      minWidth: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 4 ,
                                      onPressed: ()  {

                                      },
                                      child: Text("Donate",
                                          textAlign: TextAlign.center,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .title.copyWith(color: Colors.white)
                                      ),
                                    ),
                            ),
                              ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          } ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if(selectedIndex == 0){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
      );
    }else if(selectedIndex == 1){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => history()),
      );
    }else if(selectedIndex == 2){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => joinCommunity()),
      );
    }else if(selectedIndex == 3){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => profilePage()),
      );
    }
  }
}
