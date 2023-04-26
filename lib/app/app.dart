import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/adminsignup.dart';
import 'package:fooddelivery/scaffolds/admin/appointment.dart';
import 'package:fooddelivery/scaffolds/firstScreen.dart';
import 'package:fooddelivery/scaffolds/user/home.dart';
import '../scaffolds/user/doctorsBooked.dart';
import '../scaffolds/user/userlocation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.green,
          background:  Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
