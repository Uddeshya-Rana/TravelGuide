
//This page is the root of all the navigation pages

import 'package:flutter/material.dart';
import 'package:travelguide/pages/navigation_pages/nav_routes/navigation_bar_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int index=0;

  void onNavBarItemTap(int i){
    //re-builds the page
    setState( (){
      index = i;
    } );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: navigationPages[index], //our default nav page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Page'),
        ],
        backgroundColor: Colors.white,
        onTap: onNavBarItemTap, //the onTap function by default passes currentIndex argument
        currentIndex: index, //items index number for currently active navigation bar item
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black26,
        showSelectedLabels: false, //alternatively you can make selectedFontSize zero
        showUnselectedLabels: false,
        elevation: 0, //we don't want navigation bar to be lifted

        //by default the bar items shifts when tapped
        type: BottomNavigationBarType.fixed, //To make the bar items fixed and don't change position on tapping
      ),
    );
  }
}

