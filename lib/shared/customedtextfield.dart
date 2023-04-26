import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  dynamic prefix;
  dynamic suffix;
  dynamic fillcolor;
  String x = "";

  dynamic color;
  bool IsObsecure;
  FormFields(this.x,this.prefix,this.suffix,this.IsObsecure,this.textFieldController, this.fillcolor, this.color);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(height:1.8, color: Colors.white, fontFamily: 'sign', fontWeight: FontWeight.w900),
        validator: (String? text){
          if(textFieldController.text == ''){
            return 'This Field is Required.';
          }
        },
        obscureText: IsObsecure,
        cursorColor: Colors.white,
        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: fillcolor,
          floatingLabelStyle: const TextStyle(color:Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width:1.5),
          ),
          labelText: x,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            //borderSide: BorderSide(color: Colors.white, width: 3)
          ),
        ));
  }
}