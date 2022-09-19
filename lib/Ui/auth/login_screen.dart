import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/Ui/Posts/posts.dart';
import 'package:firebase_series/Ui/auth/phone_number%20Auth.dart';
import 'package:firebase_series/Ui/auth/signup_screen.dart';
import 'package:firebase_series/Utils/Firebase%20Toast.dart';
import 'package:firebase_series/Widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _formkey=GlobalKey<FormState>();
    final auth=FirebaseAuth.instance;


    void isLogin()
    {
      auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
        // final  snackBar=SnackBar(content: Text('Success '),
        //
        //     backgroundColor: Colors.red,
        //   action: SnackBarAction(label: 'Good ', onPressed: ()
        //   {
        //
        //
        //   }),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);


            Navigator.push(context, MaterialPageRoute(builder: (context) =>PostScreen(),));
        flutterToast().toastmessage(value.user!.email.toString());


      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        flutterToast().toastmessage(error.toString());



      });





    }









  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async
      {
        SystemNavigator.pop();
        return true;


      },

      child: Scaffold(
        appBar: AppBar(title: Text('Login Screen'),backgroundColor: Colors.green,),
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
              child: RoundButton(title: 'Login',onTap: (){
                if(_formkey.currentState!.validate()){
                  isLogin();




                }






              },),
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have account"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                  
                  
                  
                }, child: Text("Sign Up"))
                
                
                
                
              ],
              
              
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => phoneNumAuth(),));



                },


                child: Container(


                  height: 45,
                  decoration: BoxDecoration(


                   border: Border.all(
                     color: Colors.black,
                     width: 2


                   ),




                  ),
                  child: Center(child: Text('Sign In with Phone',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.black),)),





                ),
              ),
            ),
            
            
            


            
          ],




        ),



      ),
    );
  }
}
