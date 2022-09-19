import 'package:firebase_series/Widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class addPosts extends StatefulWidget {
  const addPosts({Key? key}) : super(key: key);

  @override
  State<addPosts> createState() => _addPostsState();
}

class _addPostsState extends State<addPosts> {


  bool loading=false;
  final _postController=TextEditingController();
  final databaseRef=FirebaseDatabase.instance.ref('Posts');



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Posts'),),

      body: Column(children: [

        SizedBox(height: 25,),

        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: _postController,
            maxLines: 5,
            keyboardType: TextInputType.text,


             decoration: InputDecoration(

               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                     color: Colors.black



                 ),




               ),


               enabled: true,
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black



                 ),




               ),

               hintText: " Whats  on  ur mind ? "



             ),



          ),
        ),
        SizedBox(height: 20,),
        RoundButton(title: " Add mesg", onTap: (){
              databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({

                  'Title ' : _postController.text.toString(),
                   'Id ' : DateTime.now().microsecondsSinceEpoch.toString(),

              });







        })












      ],

      ),









    );
  }
}
