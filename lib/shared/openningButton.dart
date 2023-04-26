import 'package:flutter/material.dart';

class OpenningButtons extends StatelessWidget {
  late dynamic buttonText;
  final VoidCallback ontap;
  var width, height, size;

  OpenningButtons({required this.ontap, required this.buttonText});
  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Container(
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
          color: Colors.green,
            minWidth: width*0.8,
            height: height*0.06,
            child:buttonText,
            onPressed: ontap,
        ),
      ),
    );
  }
}
