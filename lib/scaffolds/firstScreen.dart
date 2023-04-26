
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/second.dart';


class FirstScreen extends StatelessWidget {
  var width, height, size ;

  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset("assets/doctor.jpg", width:500,),
                Padding(
                  padding: EdgeInsets.only(top: height*0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
                    child: Container(
                      color: Colors.white,
                      width:  width,
                      height: height*0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.04),
                            child: Text("Find Your", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),),
                          ),
                          Text("Own doctor", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),),
                          Padding(
                            padding: EdgeInsets.only(top: height*0.02),
                            child: Center(child: Text("Medicines cure diseases but only",style: TextStyle(color: Colors.grey, fontSize: 25), )),
                          ),
                          Center(child: Text("doctors can cure patients",style: TextStyle(color: Colors.grey, fontSize: 25), )),
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(200)
                              ),
                              width: width*0.24,
                                height: height*0.11,
                                child: IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
                                }, icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 100,))),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
