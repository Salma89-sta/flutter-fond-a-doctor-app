import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/userbottomnavigation.dart';

import '../../shared/userdoctorcard.dart';

class UserAppointments extends StatelessWidget {
   UserAppointments({Key? key}) : super(key: key);
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  var width, height, size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      bottomNavigationBar: bottomnavigationbar(2),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Untitled-5.png"),
                  fit: BoxFit.fill
                )
              ),
              child:Container(
                width: width,
                height: height,
                color: Colors.transparent.withOpacity(0.5),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:height*0.15),
                        child: Text("My Appointments", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: height*0.8,
                        child: FutureBuilder(
                            future: FirebaseFirestore.instance.collection('user').doc(currentID).collection("muDoctors").get(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return Text('No Data');
                              }
                              return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  return UserDoctorCard(snapshot.data.docs[index]["doctor"],snapshot.data.docs[index]["major"],snapshot.data.docs[index]["image"]);
                                },
                              );
                            }
                        ),
                      ),
                    ],
                  ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
