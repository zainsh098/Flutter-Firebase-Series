import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_series/Ui/Posts/add_posts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  FirebaseAuth auth=FirebaseAuth.instance;
  final refDatabase=FirebaseDatabase.instance.ref('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Posts'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => addPosts(),));




      },
        child: Icon(Icons.add),

      ),
    body: Column(children: [
      Expanded(
        child: FirebaseAnimatedList(
            query: refDatabase,
            itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('Title ').value .toString()),
                    subtitle: Text(snapshot.child('Id ').value .toString()),







                  );


            },),
      )
      
      













    ],

    ),
      







    );
  }
}
