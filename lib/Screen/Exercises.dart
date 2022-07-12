import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screen/videoplay.dart';

import 'loading.dart';
class Exercise extends StatefulWidget {
  String Exercises;

  Exercise({this.Exercises});

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  //Query reference = FirebaseFirestore.instance.collection(widget.Exercises);

  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection(widget.Exercises);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Exercises"),


      ),
      body: Column(

        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(


                stream: reference.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData) {
                    return
                      Container(
                        child:          GridView.builder( shrinkWrap: true,
                          primary: true,
                          itemCount: snapshot.data.size,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context,int index){
                            var docu = snapshot.data.docs[index].data();
                            return Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp(titt: docu["tittle"],desc: docu['description'],reps: docu['Reps'],rests: docu['Rests'],sets: docu['Sets'],vurl: docu['videos'],)));
                                },
                                child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,

                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(docu['tittle'],style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.brown
                                            ),),
                                          ),

                                          SizedBox(height: 30,),
                                          Text("Reps",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.brown

                                          ),),
                                          Text(docu['Reps'],style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.brown

                                          ),),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text("Sets",style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.brown

                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text(docu['Sets'],style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.brown

                                            ),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Text("Rest",style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.brown

                                            ),),
                                          ),
                                          Text(docu['Rests'],style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.brown

                                          ),),
                                        ],

                                      ),
                                    )
                                ),
                              ),
                            );
                          },
                        ),


                      );



                  }

                  else{
                    return Loading();
                  }

                }),
          ),

        ],
      ),
    );
  }
}
