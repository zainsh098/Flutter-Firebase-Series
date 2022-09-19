import 'package:firebase_series/Ui/auth/login_screen.dart';
import 'package:firebase_series/Utils/Firebase%20Toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Widgets/round_button.dart';
import '../Posts/posts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  bool loading =false;

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _formkey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp Screen',),backgroundColor: Colors.amber,
      actions: [
        IconButton(onPressed: (){
          auth.signOut().then((value) {

            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));




          }).onError((error, stackTrace) {



          });



        }, icon: Icon(Icons.logout_outlined))


      ]),
















      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          Form(
              key: _formkey,


              child: Column(
                children: [


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType:TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Enter Email ';

                        }
                        else
                        {

                          return null;
                        }


                      },
                      decoration: InputDecoration(
                        helperText: 'Enter Email ',
                        hintText: 'Email',





                        prefixIcon: Icon(Icons.email),
                        enabled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),

                        ),




                      ),



                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,

                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Enter Password ';

                        }
                        else
                        {

                          return null;
                        }


                      },

                      decoration: InputDecoration(
                        helperText: 'Enter Password ',
                        hintText: 'Password',





                        prefixIcon: Icon(Icons.password),
                        enabled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),

                        ),




                      ),



                    ),
                  ),





                ],




              )),

          SizedBox(height: 30,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundButton(title: 'Login',loading: loading,onTap: (){
              if(_formkey.currentState!.validate()){

                setState(() {
                   loading=true;



                });
                auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
                  setState(() {
                    loading=false;



                  });

                }).onError((error, stackTrace) {
                  setState(() {
                    loading=false;



                  });
                  flutterToast().toastmessage(error.toString());



                });




              }






            },),
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have an  account"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));



              }, child: Text("Sign In"))




            ],


          ),




        ],




      ),



    );
  }
}















