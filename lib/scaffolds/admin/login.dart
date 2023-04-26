import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/admin/adminProfile.dart';
import 'package:fooddelivery/scaffolds/admin/adminlocation.dart';
import 'package:fooddelivery/scaffolds/admin/adminsignup.dart';
import 'package:fooddelivery/scaffolds/user/signup.dart';

import '../../main.dart';
import '../../shared/customedtextfield.dart';
import '../../shared/openningButton.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? email = new TextEditingController();
  TextEditingController? password = new TextEditingController();
  bool passwordVisible = false;
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Untitled-5.png"),
                  ),
                ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:height*0.05),
                    child: Center(
                        child: Text(
                          'Welcome,',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:height*0.02),
                    child: Center(
                        child: Text('Glad to see you!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ))),
                  ),
                  
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.08),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(150)),
                      child: Container(
                        color: Colors.transparent.withOpacity(0.5),
                        width: width,
                        height: height *0.8,
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: height*0.1, left: width*0.1, right: width*0.1),
                                      child: FormFields(
                                          "Email",
                                          Icon(
                                            Icons.email,
                                            color: Colors.white,
                                          ),
                                          null,
                                          false,
                                          email!,
                                          Colors.transparent,
                                          Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: height*0.05,  left: width*0.1, right: width*0.1),
                                      child: FormFields(
                                          "PassWord",
                                          IconButton(
                                            icon: Icon(
                                              passwordVisible
                                                  ? Icons.lock_open
                                                  : Icons.lock_outline,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isSecure = !isSecure;
                                                passwordVisible = !passwordVisible;
                                              });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isSecure = !isSecure;
                                                passwordVisible = !passwordVisible;
                                              });
                                            },
                                          ),
                                          isSecure,
                                          password!,
                                          Colors.transparent,
                                          Colors.orange),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: height*0.05),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow:[
                                            BoxShadow(
                                              color: Colors.white,
                                              offset:Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 10.0,
                                              spreadRadius: 2.0,
                                            ),],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: MaterialButton(
                                            color: Colors.white,
                                            minWidth: width*0.8,
                                            height: height*0.06,
                                            child: Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),),
                                            onPressed: ()async {
                                              String output=  await authenticationMethods.logInUser(
                                                  email:email!.text,
                                                  password: password!.text);
                                              print(output);
                                              print('..............................................................');

                                              if (output == "success") {
                                                final currentUser = FirebaseAuth.instance;
                                                String currentID = FirebaseAuth.instance
                                                    .currentUser!.uid;
                                                print(
                                                    'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL................................................');
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProfile()));

                                              }
                                              else {
                                                //error
                                              }
                                            },),
                                        ),
                                      ),
                                      // OpenningButtons(ontap: () async {
                                      //   String output=  await authenticationMethods.logInUser(
                                      //       email:email!.text,
                                      //       password: password!.text);
                                      //   print(output);
                                      //
                                      //   if (output == "success") {
                                      //     final currentUser = FirebaseAuth.instance;
                                      //     String currentID = FirebaseAuth.instance
                                      //         .currentUser!.uid;
                                      //     print(
                                      //         'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL................................................');
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProfile()));
                                      //
                                      //   }
                                      //   else {
                                      //     //error
                                      //   }
                                      // },
                                      //     buttonText: Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),)),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(top: height*0.05),
                                      child: Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Center(
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=> AdminSignup()));
                                          },
                                            child: Text(
                                              'Sign up now!',
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 20),
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
