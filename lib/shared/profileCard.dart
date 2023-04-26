import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
   ProfileCard(this.name, this.major, this.im, this.ontap);

   String im='https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000';
   String name='';
   String major='dentist';
   bool favIcon=false;
   final VoidCallback ontap;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
   var width, height, size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding:EdgeInsets.all(10.0),
      child: Stack(
        children: [

         Padding(
           padding:  EdgeInsets.only(left:width*0.38),
           child: Container(
             width: width*0.6,
             height:height*0.18,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               border: Border.all(
                 color: Colors.green,
                 width: 2,
               ),
             ),
             child: Column(
               children: [
                 Padding(
                   padding: EdgeInsets.only(top:8, bottom: 5),
                   child: Center(child: Text("Dr.${widget.name}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 20),)),
                 ),
                 Center(child: Text("${widget.major}", style: TextStyle(color: Colors.green, fontSize: 20),textAlign: TextAlign.center,)),
                 Padding(
                   padding:  EdgeInsets.only(left:width*0.09, top: height*0.02),
                   child: Row(
                     children: [
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
                         child: MaterialButton(
                             color: Colors.green,
                             child: Text("More details", style: TextStyle(color: Colors.white),),
                             onPressed:widget.ontap
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.1),
                         child: IconButton(onPressed: (){
                           setState(() {
                           });
                           widget.favIcon = !widget.favIcon ;
                         }, icon:Icon(widget.favIcon?Icons.favorite: Icons.favorite_border, color: Colors.green,) ,
                         ),
                       ),],
                   ),
                 ),
               ],
             ),
           ),
         ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.012),
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
