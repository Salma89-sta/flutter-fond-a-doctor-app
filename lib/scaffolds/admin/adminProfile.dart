import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/adminEdit.dart';
import 'package:fooddelivery/scaffolds/admin/adminlocation.dart';
import '../../authentication/firesroreAthuntication.dart';
import '../../shared/adminBottomnav.dart';

class AdminProfile extends StatelessWidget {
   AdminProfile({Key? key}) : super(key: key);
var size, width, height;
   AuthenticationMethods authenticationmethods = AuthenticationMethods();
   final currentUser = FirebaseAuth.instance;
   String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      bottomNavigationBar: AdminBottomNav(0),
    backgroundColor:Colors.green ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            color: Colors.transparent.withOpacity(0.4),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: height*0.1),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: Colors.white)
                      ),
                      width: width*0.5,
                      height: height*0.25,
                      child:  FutureBuilder(
                          future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData == false) {
                              return Text('No Data');
                            }
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network("${snapshot.data['image']}"));
                          }
                      ),
                    ),
                  ),
                ),
                Container(
                  child:  FutureBuilder(
                      future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return Text('No Data');
                        }
                        return Padding(
                          padding:  EdgeInsets.only(top: height*0.03),
                          child: Text("Dr.${snapshot.data['name']}", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                        );
                      }
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.4, top: height*0.01, bottom: height*0.01),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white,),
                      FutureBuilder(
                          future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData == false) {
                              return Text('No Data');
                            }
                            return Text("${snapshot.data['phone']}", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),);
                          }
                      ),

                      IconButton(onPressed: (){
                        FutureBuilder(
                            future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return Text('No Data');
                              }
                              return Text("${snapshot.data['address']}", style: TextStyle(color: Colors.white),);
                            }
                        );

                      }, icon: Icon(Icons.location_on_outlined, color: Colors.white,))
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top:height*0.01, bottom: height*0.01, left: width*0.2),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 20.0),
                        child: Container(
                          child:  FutureBuilder(
                              future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData == false) {
                                  return Text('No Data');
                                }
                                return Text("Year of graduation: ${snapshot.data['yearOfGraduation']}", style: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold),);
                              }
                          ),
                        ),
                      ),
                      Container(
                        child:  FutureBuilder(
                            future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return Text('No Data');
                              }
                              return Center(child: Text("Age: ${snapshot.data['age']}", style: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold),));
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:height*0.01, bottom: height*0.01),
                  child: Container(
                    child:  FutureBuilder(
                        future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text('No Data');
                          }
                          return Text("Major of.${snapshot.data['major']}", style: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,);
                        }
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:height*0.01, bottom: height*0.05),
                  child: Container(
                    child:  FutureBuilder(
                        future: FirebaseFirestore.instance.collection('admin').doc(currentID).get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return Text('No Data');
                          }
                          return Center(child: Center(child: Text("${snapshot.data['history']}",textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize: 20,),)));
                        }
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.green,
                        offset:Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: MaterialButton(
                      minWidth: width*0.8,
                      height: height*0.06,
                      color: Colors.green,
                        child: Text('Edit Details', style: TextStyle(color: Colors.white, fontSize: 25),),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditAdminDetails()));
                        }),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height*0.04, bottom: height*0.01),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                          color: Colors.green,
                          offset:Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                          minWidth: width*0.8,
                          height: height*0.06,
                          color: Colors.green,
                          child: Text('Edit Location', style: TextStyle(color: Colors.white, fontSize: 25),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLocation()));
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
