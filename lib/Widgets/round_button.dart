import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {


  final bool loading;

final VoidCallback onTap;
final String title ;
  const RoundButton({Key? key,required this.title,required this.onTap,this.loading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,


      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(12)




        ),




        child: Center(child:loading ? CircularProgressIndicator( strokeWidth: 3,color: Colors.white,): Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)),




      ),
    );
  }
}
