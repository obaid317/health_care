import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Loading.dart';
class Hellll extends StatefulWidget {
  String uid;

  Hellll(this.uid);

  @override
  _HellllState createState() => _HellllState();
}

class _HellllState extends State<Hellll> {


  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection("appointment").where('uid',isEqualTo: widget.uid);

    return  Container(
      child: StreamBuilder<QuerySnapshot>(


          stream: reference.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            print(widget.uid);
            if(snapshot.hasData) {
              return                  Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(33)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),


                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.size,
                        itemBuilder: (BuildContext context,int index ){
                          var docu = snapshot.data.docs[index].data();
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: GestureDetector(
                              onTap: (){
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.grey[200]),

                                ),
                                child:  Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  padding: EdgeInsets.all(5.0),

                                  child: Row(
                                    children: <Widget>[
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: Ink.image(
                                          fit: BoxFit.cover,
                                          width: 100.0,
                                          height: 120,
                                          image:AssetImage('assets/abc.png'),

                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            SizedBox(height: 6,),

                                            Text(docu['name'],  style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                            ),
                                            ),
                                            SizedBox(height: 6,),

                                            Text(docu['date'],  style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                            ),
                                            ),
                                            SizedBox(height: 6,),

                                            Text(docu['status'],  style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                            ),
                                            ),
                                            SizedBox(height: 6,),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          );

                        },
                      ),
                    ),

                  ],
                ),
              )                     ;


            }

            else{
              return Loading();
            }

          }),
    );
  }
}
