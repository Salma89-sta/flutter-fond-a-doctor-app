import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/adminlocation.dart';


import '../scaffolds/admin/adminProfile.dart';
import '../scaffolds/admin/appointment.dart';


class AdminBottomNav extends StatefulWidget {
   late int _currentIndex;
   AdminBottomNav(this._currentIndex);
  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: widget._currentIndex,
          onTap: (index) {
            if(index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AdminProfile()));
              widget._currentIndex= index;
            }
            if(index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminLocation()));
              widget._currentIndex= index;
            }
            if(index == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Calender()));
              widget._currentIndex= index;
            }
          },
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation:0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.teal[900],
          selectedIconTheme: IconThemeData(color: Colors.teal[900]),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "User Location",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: "Appointments",
            ),
          ],
        ),
      ),
    );
  }
}
