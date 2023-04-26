import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDoctorCard extends StatefulWidget {
  UserDoctorCard(this.name, this.major, this.im);

  String im='https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000';
  String name='';
  String major='dentist';
  bool favIcon=false;

  @override
  State<UserDoctorCard> createState() => _UserDoctorCardState();
}

class _UserDoctorCardState extends State<UserDoctorCard> {
  var width, height, size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding:  EdgeInsets.only(top: 20.0),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:width*0.38, top: height*0.011),
            child: Container(
              width: width*0.6,
              height:height*0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:30, bottom: 5),
                    child: Center(child: Text("Dr.${widget.name}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                  Center(child: Text("${widget.major}", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,)),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.011),
            child: Container(
                height: height*0.15,
                width: width*0.4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network("${widget.im}", fit: BoxFit.fill,))),
          ),
        ],
      ),
    );
  }
}
