
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/openningButton.dart';

import '../../shared/editTextfield.dart';

class EditAdminDetails extends StatelessWidget {
   EditAdminDetails({Key? key}) : super(key: key);
   TextEditingController name= new TextEditingController();
   TextEditingController money= new TextEditingController();
   TextEditingController phone= new TextEditingController();
   TextEditingController age= new TextEditingController();
   TextEditingController history= new TextEditingController();
   TextEditingController yearOfGrad= new TextEditingController();
   TextEditingController major= new TextEditingController();
   final currentUser = FirebaseAuth.instance;
   String currentID = FirebaseAuth.instance.currentUser!.uid;
   var height, width , size;
  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*0.07),
              child: Center(child: Text("Edit your ", style: TextStyle(color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*0.01),
              child: Center(child: Text("Information", style: TextStyle(color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),)),
            ),
            Center(child: Text("Fill all the fields even you don't want to update or skip", style: TextStyle(color: Colors.grey),)),
            Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("Name", Icon(Icons.perm_identity, color: Colors.green,), name, Colors.transparent),
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("phone", Icon(Icons.phone, color: Colors.green,), phone, Colors.transparent),
            ),Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("Age", Icon(Icons.contact_page, color: Colors.green,), age, Colors.transparent),
            ),Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("History", Icon(Icons.format_list_bulleted, color: Colors.green,), history, Colors.transparent),
            ),Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("Major", Icon(Icons.factory, color: Colors.green,), major, Colors.transparent),
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("Year of graduation", Icon(Icons.perm_identity, color: Colors.green,), yearOfGrad, Colors.transparent),
            ),
            Padding(
              padding: EdgeInsets.only(left:width*0.1, right: width*0.1, top: height*0.03),
              child: EditFormField("Salary", Icon(Icons.money_rounded, color: Colors.green,), money, Colors.transparent),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*0.03),
              child: OpenningButtons(ontap: (){
                FirebaseFirestore.instance.collection('admin').doc(currentID).update(<String,dynamic>{
                  'yearOfGraduation': yearOfGrad.text,
                  'history': history.text,
                  'major':major.text,
                  'age':age.text,
                  'name':name.text,
                  'phone':phone.text,
                  'money':money.text,
                }).then((value) => Navigator.pop(context)); }, buttonText: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*0.03),
              child: OpenningButtons(ontap: (){
                Navigator.pop(context);
              }, buttonText: Text("Skip", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}
