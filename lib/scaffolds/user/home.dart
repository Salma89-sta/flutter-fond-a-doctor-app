import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/user/doctorDetails.dart';
import 'package:fooddelivery/scaffolds/user/nearstdoc.dart';
import 'package:fooddelivery/shared/openningButton.dart';

import '../../shared/profileCard.dart';
import '../../shared/userbottomnavigation.dart';
import '../../shared/userpickimage.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   var size , width, height;

   final currentUser = FirebaseAuth.instance;

   String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      bottomNavigationBar: bottomnavigationbar(0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                children: [
                  Row(
                children: [
                Container(
    height: 95,
    child: FutureBuilder(
    future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
    builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.hasData == false) {
    return Text('No Data');
    }
    return ImageDrawer(snapshot.data['image']);
    }
    ),
    ),
                  Column(
                    children: [
                      Text("Good morning !", style: TextStyle(color: Colors.grey, fontSize: 20),),
                      FutureBuilder(
                          future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData == false) {
                              return Text('No Data');
                            }
                            return Center(child:Text("${snapshot.data['name']}",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38, fontSize: 15),));
                          }
                      ),
                    ],
                  ),
                ],
                ),

                  Padding(
                    padding:  EdgeInsets.only(top: height*0.02),
                    child: Container(
                      height: height*0.22,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            child: Image.asset("assets/5685497.jpg"),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0, right: 8),
                            child: Image.asset("assets/6004853.jpg"),
                          ),
                          Image.asset("assets/6071562.jpg"),
                        ],
                      ),
                    ),
                  ),
                  Text("Find your own doctor",style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.black38),),
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.05, left: width*0.02),
                    child: Stack(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color:Colors.green,
                        //     borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100), topRight: Radius.circular(100), bottomRight: Radius.circular(100))
                        //   ),
                        //   width: width*0.4,
                        //   height: height*0.16,
                        //   child:ClipRRect(
                        //       borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100), topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                        //       child: Image.asset("assets/WhatsApp Image 2023-02-07 at 2.31.04 AM.jpeg")),
                        // ),
                        // Padding(
                        //   padding:  EdgeInsets.only(left: width*0.28),
                        //   child: Container(
                        //     height: height*0.15,
                        //     width: width*0.63,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(color: Colors.green,
                        //       width: 2,
                        //       ),
                        //     ),
                        //     child: Column(
                        //       children: [
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height*0.5,
                    child: FutureBuilder(
                        future: FirebaseFirestore.instance.collection('admin').get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text('No Data');
                          }
                            return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return ProfileCard(snapshot.data.docs[index]['name'], snapshot.data.docs[index]['major'], snapshot.data.docs[index]['image'],(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    DoctorDetails(snapshot.data.docs[index]['phone'],snapshot.data.docs[index]['salary'],snapshot.data.docs[index]['major'],snapshot.data.docs[index]['name'],snapshot.data.docs[index]['history'],snapshot.data.docs[index]['image'],snapshot.data.docs[index]['from'],snapshot.data.docs[index]['to'],snapshot.data.docs[index]['day'])));
                              });
                            },
                          );
                        }

                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.only( bottom: 30),
                    child: FutureBuilder(
                        future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text('No Data');
                          }
                          return OpenningButtons(ontap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> FindYourNearstDoctor(double.parse(snapshot.data['lat']),double.parse(snapshot.data['lon']))));
                          }, buttonText: Text("Find your nearst doctor", style: TextStyle(color: Colors.white, fontSize: 25),));
                        }
                    ),
                  )
                ],
          ),
        ),
      ),
    );
  }
}
