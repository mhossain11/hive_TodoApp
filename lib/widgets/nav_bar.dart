import 'package:cach_hive/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../screen/fav_screen.dart';

class NavigationBarScreen extends StatefulWidget{
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  List pages = [HomeScreen(),FavouriteScreen()];
  int currentIndex =0;

  @override
  Widget build(BuildContext context) {
      return Scaffold(



        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
            selectedItemColor: Colors.green.shade400,
            unselectedItemColor: Colors.grey,
            onTap: (value){
            setState(() {
              currentIndex = value;
            });
            },
            items:[
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home)),

              BottomNavigationBarItem(
                label: "Favorite",
                  icon: Icon(Icons.favorite))
            ]),

        body: pages[currentIndex],
      );
  }
}