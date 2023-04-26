
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/adminBottomnav.dart';
import '../../shared/openningButton.dart';

class Calender extends StatelessWidget {
  TextEditingController from= new TextEditingController();
  TextEditingController to= new TextEditingController();
  dynamic x;
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdminBottomNav(2),

      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 220.0),
              child: Center(child: Text("Choose your day", style: TextStyle(color: Colors.green, fontSize: 35, fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50.0),
              child: Center(
                child: OpenningButtons(ontap:()async{
     x= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2029));
    if (x == null)
    {
    showDialog<void>(
    context: context,
    builder: (BuildContext context) {
    return
    AlertDialog(
    content: Text("You didn't choose a day"),
    actions: <Widget>[
    MaterialButton(
    onPressed: (){
    Navigator.pop(context);
    },
    child: Text("ok"),
    ),
    ],
    );});

    } } ,buttonText:Text("Click to choose", style: TextStyle(color: Colors.white, fontSize: 25),),
              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Text("From", style: TextStyle(color: Colors.grey, fontSize:30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding:  EdgeInsets.only(left: 50.0, right: 50),
                    child: TextField(controller: from,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20.0),
                    child: Text('to', style: TextStyle(color: Colors.grey, fontSize:30, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 50.0, right: 50),
                    child: TextField(controller: to,),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50.0),
              child: OpenningButtons(ontap: (){
                FirebaseFirestore.instance.collection('admin').doc(currentID).update(<String,dynamic>{
                  'day':x.toString(),
                  'from':from.text,
                  'to':to.text
                }).then((value) => {
                  from.text ='',
                  to.text=''
                });
              }, buttonText: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 25),)),
            )
          ],
        ),
      ),
    );
  }
}
