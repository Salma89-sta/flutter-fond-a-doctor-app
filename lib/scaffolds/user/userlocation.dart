import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/restOfDetails.dart';
import 'package:fooddelivery/scaffolds/user/home.dart';
import 'package:location/location.dart';

import '../../shared/userbottomnavigation.dart';

class UserLocation extends StatelessWidget {
  UserLocation({Key? key}) : super(key: key);
  var height, width,size;
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {

    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      bottomNavigationBar: bottomnavigationbar(1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/llocation.jpg",width: width, height: height,fit: BoxFit.fill, ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.75),
              child: Container(
                width: width,
                height: height*0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(100), topLeft: Radius.circular(100))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.06),
                      child: Center(
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
                            borderRadius: BorderRadius.circular(15),
                            child: MaterialButton(
                              onPressed: ()async {
                                Location loc = Location();
                                dynamic locData = await loc.getLocation();
                                double lat = locData.latitude;
                                double lon = locData.longitude  ;
    FirebaseFirestore.instance.collection('user').doc(currentID).update(<String,dynamic>{
        'lat':lat.toString(),
        'lon':lon.toString()
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home() ));
    },
                              color: Colors.green,
                              minWidth: width*0.8,
                              height: height*0.06,
                              child:Text("Open your location", style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.02),
                      child: Center(
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
                            borderRadius: BorderRadius.circular(15),
                            child: MaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                              },
                              color: Colors.green,
                              minWidth: width*0.8,
                              height: height*0.06,
                              child:Text("Skip", style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),),
                      ),
                    ),

                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
