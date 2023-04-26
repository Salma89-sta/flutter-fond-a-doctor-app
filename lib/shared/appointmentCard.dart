import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  String day;
  String from;
  String to;
  AppointmentCard(this.day, this.to, this.from);
var width, height, size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding:  EdgeInsets.only(left: width*0.01, right: width*0.01),
      child: Container(
        height: height*0.15,
        width: width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.green,
            width: 2
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding:  EdgeInsets.only(left: 80.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Text("date: ${to}", style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                Center(child: Text("From:  ${day}", style:TextStyle(color: Colors.green, fontSize: 25),)),
                Center(child: Text("To: ${from}",style:  TextStyle(color: Colors.green, fontSize: 25,))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
