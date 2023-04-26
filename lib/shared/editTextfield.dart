import 'package:flutter/material.dart';

class EditFormField extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  dynamic prefix;
  dynamic fillcolor;
  String x = "";
  EditFormField(this.x,this.prefix,this.textFieldController, this.fillcolor);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(height:1.8, color: Colors.white, fontFamily: 'sign', fontWeight: FontWeight.w900),
        validator: (String? text){
          if(textFieldController.text == ''){
            return 'This Field is Required.';
          }
        },
        cursorColor: Colors.white,
        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: prefix,
          filled: true,
          fillColor: fillcolor,
          floatingLabelStyle: const TextStyle(color:Colors.green),
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
          labelText: x,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            //borderSide: BorderSide(color: Colors.white, width: 3)
          ),
        ));
  }
}