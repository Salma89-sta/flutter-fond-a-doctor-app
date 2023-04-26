
import 'package:flutter/material.dart';
import 'package:fooddelivery/scaffolds/user/userlocation.dart';
import '../../main.dart';
import '../../shared/customedtextfield.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);
  TextEditingController? name = new TextEditingController();

  TextEditingController? email = new TextEditingController();
  // TextEditingController? type = new TextEditingController();
  TextEditingController? password = new TextEditingController();
  TextEditingController? phone = new TextEditingController();
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

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
                      padding:  EdgeInsets.only(top:height*0.09),
                      child: Center(child: Text('Create an Account', style: TextStyle(color: Colors.white , fontSize: 35, fontWeight:FontWeight.bold),)),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:height*0.02),
                      child: Center(child: Text('to get started now!',style: TextStyle(color: Colors.white , fontSize: 30,))),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: height*0.03),
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
                                        padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                                        child: FormFields("Name", Icon(Icons.perm_identity, color: Colors.white,),null, false, widget.name!, Colors.transparent, Colors.white),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(top:height*0.04,left: width*0.1, right:width*0.1),
                                        child: FormFields("Email", Icon(Icons.email, color: Colors.white,),null, false, widget.email!, Colors.transparent,Colors.white),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                                        child: FormFields("Phone", Icon(Icons.phone, color: Colors.white,),null, false, widget.phone!, Colors.transparent,Colors.white),
                                      ),
                                      // Padding(
                                      //   padding:  EdgeInsets.only(top:height*0.05,left: width*0.1, right:width*0.1),
                                      //   child: FormFields("User or Admin", Icon(Icons.perm_identity, color: Colors.white,),null, false, widget.type!, Colors.transparent,Colors.white),
                                      // ),
                                      Padding(
                                        padding:  EdgeInsets.only(top:height*0.04,left: width*0.1, right:width*0.1),
                                        child: FormFields("PassWord",  IconButton(
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
                                        ),  IconButton(
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
                                        ), isSecure ,widget.password!, Colors.transparent,Colors.orange),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(top: height*0.02),
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
                                                child: Text("SignUp", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),),
                                                onPressed: ()async {
                                          String outPut;

                                               outPut = await authenticationMethods.signUpUser(name:widget.name!.text, phone:widget.phone!.text, email:widget.email!.text,password:widget.password!.text);
                                               print("${outPut} '''''''''''''''''''''''''''''''''''''''''''''''''''''''");
                                               if(outPut =='success')
                                                 {
                                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLocation()));
                                                 }

                                        },),),),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(top: height*0.02),
                                        child: Text('Already have an account?', style:TextStyle(color: Colors.white, fontSize: 20),),
                                      ),
                                      Center(child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
                                          },
                                          child: Text('Log in now!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))),

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
