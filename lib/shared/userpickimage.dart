import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class ImageDrawer extends StatefulWidget {
  late String imagecustomer;
  ImageDrawer(this.imagecustomer);
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  State<ImageDrawer> createState() => _ImageDrawerState();
}

class _ImageDrawerState extends State<ImageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding:  EdgeInsets.only(left:20.0, top: 20),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: GestureDetector(
                    onTap: () async {
    ImagePicker a = new ImagePicker();
    dynamic b = await a.getImage(source: ImageSource.gallery );
    setState(() {
      print("fffffffffffffffffffffffffffffffffffffffffffffffff");
      print("fffffffffffffffffffffffffffffffffffffffffffffffff");

      Image.file(File(b.path));
    widget.imagecustomer=b.path ;
    FirebaseFirestore.instance.collection('user').doc(widget.currentID).update(<String,dynamic>{
    'image': b.path ,
    });
    });
    },
                    child: Container(
                      width: 75,
                      height: 75,
                      child:Image.file(File(widget.imagecustomer)),
                      decoration: BoxDecoration(
                        color:Colors.green,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
