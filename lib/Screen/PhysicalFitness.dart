import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Exercises.dart';
class PhysicalFitness extends StatefulWidget {
  @override
  _PhysicalFitnessState createState() => _PhysicalFitnessState();
}

class _PhysicalFitnessState extends State<PhysicalFitness> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
          child: Container(
            child:Column(
              children: [
                SizedBox(height: 30,),
                _introCard(),
                _introCardd(),
                _introCarddd(),
              ],
            ) ,

          )),
    );
  }




  _introCard()
  {
    return GestureDetector(
      onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "beginners",)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
          color: Colors.brown,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Basic' ,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),

                SizedBox(width: 8),
                Icon(FontAwesomeIcons.arrowRight,
                    size: 26, color: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
  _introCardd()
  {
    return GestureDetector(
      onTap: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "intermediate",)));
      },
      child: Container(
        width: MediaQuery.of(context).size.height*0.49,
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
          color: Colors.brown,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Medium' ,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),


                Icon(FontAwesomeIcons.arrowRight,
                    size: 26, color: Colors.white),
          ],
            )
          ],
        ),
      ),
    );
  }
  _introCarddd()
  {
    return GestureDetector(
      onTap: (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "pro",)));
      },
      child: Container(
        width: MediaQuery.of(context).size.height*0.49,
        margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tough' ,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),

                Icon(FontAwesomeIcons.arrowRight,
                    size: 26, color: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }




}

