import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fooddelivery/shared/openningButton.dart';

import '../../shared/appointmentCard.dart';

class DoctorDetails extends StatefulWidget {
   String name='doctor';
   String major='dentist';
   String history='lorem';
   String salary='300';
   String image='url';
    String phone='01005896365';
    String from='';
    String to='';
   String day='';
   final currentUser = FirebaseAuth.instance;
   String currentID = FirebaseAuth.instance.currentUser!.uid;
DoctorDetails(this.phone, this.salary, this.major, this.name, this.history, this.image,this.from, this.day, this.to);
   @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
var width , height , size;

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width ,
                  height: height*0.6,
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:height*0.12),
                        child: Container(
                            width: width*0.4,
                            height: height*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network("${widget.image}"))),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:15),
                        child: Text("Dr.${widget.name}",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("${widget.major}",textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize: 25),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width*0.35),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right:30),
                              child: IconButton(onPressed: (){
                                setState(() {
                                  FlutterPhoneDirectCaller.callNumber("${widget.phone}");
                                });
                              }, icon: Icon(Icons.phone, color: Colors.white,)),
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                              });
                            }, icon: Icon(Icons.location_on_outlined, color: Colors.white,)),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height*0.5),
                  child: Container(
                    width: width,
                    //height: height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 10.0, top: 20, bottom: 20),
                          child: Row(
                            children: [
                              Icon(Icons.money_rounded, color: Colors.green, size: 50,),
                              Column(
                                children: [
                                  Text("${widget.salary} EGP", style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),),
                                  Text("Consultation Fees", style: TextStyle(color: Colors.grey, fontSize: 18),),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Center(child: Text("${widget.history}",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey, fontSize: 25),)),
                        ),
                        Center(child: Text("Doctor appointments", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                          child: AppointmentCard(widget.from, widget.to,widget.day.toString()),
                        ),
                        // Container(
                        //   width: width*0.8,
                        //   height: height*0.5,
                        //   child: FutureBuilder(
                        //       future: FirebaseFirestore.instance.collection('admin').doc().collection('appoinments').get(),
                        //       builder: (context, AsyncSnapshot snapshot) {
                        //         if (snapshot.hasData == false) {
                        //           print("jyhgfgtchtdtydtdyttdytydtytytyttyttfttfttttttttttttttttttttttttttttttttttttttttt");
                        //           return Text('No Data');
                        //         }
                        //           return  ListView.builder(
                        //             itemCount: snapshot.data.docs.length,
                        //             itemBuilder: (context, index) {
                        //               return AppointmentCard(snapshot.data['from'], snapshot.data['to'], snapshot.data['day']) ;
                        //             },
                        //           );
                        //             AppointmentCard(snapshot.data['from'], snapshot.data['to'], snapshot.data['day']) ;
                        //       }
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height, bottom: height*0.015),
                  child: Center(child: OpenningButtons(ontap: (){
                    FirebaseFirestore.instance.collection('user').doc(widget.currentID).collection('muDoctors').add(<String,dynamic>{
                      'doctor':widget.name.toString(),
                      'image':widget.image.toString(),
                      'major':widget.major.toString()
                    });
                    showDialog(
                        context: context,
                        builder: (x){
                          return AlertDialog(
                            title: Text("Booking done"),
                            actions: [
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close")
                              )
                            ],
                          );
                        }
                    );
                  }, buttonText: Text("Book now", style: TextStyle(color: Colors.white, fontSize: 25),),)),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height*1.08, bottom: height*0.015),
                  child: Center(child: OpenningButtons(ontap: (){
                    Navigator.pop(context);
                  }, buttonText: Text("Back", style: TextStyle(color: Colors.white, fontSize: 25),),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
