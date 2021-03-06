import 'package:flutter/material.dart';
import 'package:greenovation/pages/history.dart';
import 'package:greenovation/pages/profilrPage.dart';

import 'homePage.dart';

class joinCommunity extends StatefulWidget {
  @override
  _joinCommunityState createState() => _joinCommunityState();
}

class _joinCommunityState extends State<joinCommunity> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Community'),
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
