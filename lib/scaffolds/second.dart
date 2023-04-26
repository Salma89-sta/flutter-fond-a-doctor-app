import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/adminsignup.dart';
import 'package:fooddelivery/scaffolds/user/signup.dart';

import '../shared/openningButton.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  var height, width, size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: height*0.19),
              child: Center(child: Text("Get your own choice", style: TextStyle(color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),)),
            ),
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: height*0.28),
                child: Container(
                  child: Image.asset("assets/second.png", width: width*0.7,),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height*0.6),
                        child: OpenningButtons(ontap:
                            (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                        }, buttonText: Text("Patient", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),) ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*0.03),
                        child: OpenningButtons(ontap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminSignup()));
                        }, buttonText: Text("Doctor", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),) ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
