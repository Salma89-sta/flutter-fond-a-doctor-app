import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/firesroreAthuntication.dart';
import '../../shared/customedtextfield.dart';
import 'adminProfile.dart';

class AdminDetails extends StatelessWidget {
   AdminDetails({Key? key}) : super(key: key);
   TextEditingController? address = new TextEditingController();
   TextEditingController? major = new TextEditingController();
   TextEditingController? salary = new TextEditingController();
   TextEditingController? yearOfGrad = new TextEditingController();
   TextEditingController? history = new TextEditingController();
   TextEditingController? photoUrl = new TextEditingController();
   TextEditingController? age = new TextEditingController();
   AuthenticationMethods authenticationmethods = AuthenticationMethods();
   final currentUser = FirebaseAuth.instance;
   String currentID = FirebaseAuth.instance.currentUser!.uid;
   final formKey = GlobalKey<FormState>();
   var size, height, width;

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.only(top:height*0.1),
                        child: Text('Complete your ', style: TextStyle(color: Colors.green,fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.only(top:height*0.15),
                        child: Text('Profile !!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.18),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.085,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                              style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                cursorColor: Colors.green,
                                controller: major,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.description, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Major",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.04,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(yearOfGrad == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: yearOfGrad,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.perm_identity, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Year of graduation",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(history == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: history,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.format_list_bulleted, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "History",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(age == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: age,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.perm_identity, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Age",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(address == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: address,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.add_location_alt_sharp, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Address",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(salary == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: salary,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.money, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Salary",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                            child:TextFormField(
                                style: TextStyle(height:1.8, color: Colors.green,fontWeight: FontWeight.w900),
                                validator: (String? text){
                                  if(photoUrl == ''){
                                    return 'This Field is Required.';
                                  }
                                },
                                cursorColor: Colors.green,
                                controller: photoUrl,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.image, color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  floatingLabelStyle:  TextStyle(color:Colors.lightGreen),
                                  labelStyle: TextStyle(color: Colors.green),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width:1.5),
                                  ),
                                  labelText: "Photo URL",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green, width: 3)
                                  ),
                                )
                            ) ,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.035),
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
                                    child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                                    onPressed: (){
                                      FirebaseFirestore.instance.collection('admin').doc(currentID).update(<String,dynamic>{
                                        'yearOfGraduation': yearOfGrad!.text,
                                        'history': history!.text,
                                        'image': photoUrl!.text,
                                        'major':major!.text,
                                        'age':age!.text,
                                        'salary':salary!.text,
                                        'address':address!.text,
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProfile()));
                                    }
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
