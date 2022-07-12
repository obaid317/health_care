import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Loading.dart';
class DoctorConsultation extends StatefulWidget {
  String uid;

  DoctorConsultation(this.uid);

  @override
  _DoctorConsultationState createState() => _DoctorConsultationState();
}

class _DoctorConsultationState extends State<DoctorConsultation> {

  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection("appointment").where('docuid',isEqualTo: widget.uid);

    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Appointments"),
        backgroundColor: Colors.brown,
      ),
      body:  Container(
        child: StreamBuilder<QuerySnapshot>(


            stream: reference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
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
                                  showDialog(context: context,builder: (context)=>Dialog(
                                    child: SingleChildScrollView(
                                      //    scrollDirection: Axis.horizontal,
                                      child: Container(
                                        height: 200,
                                        child:  Column(
                                          children: [
                                            Form(
                                              child:  Column(
                                                children: [
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(vertical:28.0,horizontal: 8),
                                                   child: Text("Accept or reject this Appointment",style: TextStyle(
                                                     color: Colors.brown,

                                                   ),),
                                                 ),
                                                  SizedBox(height:30),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      ButtonTheme(
                                                        minWidth: 110.0,
                                                        height: 45.0,
                                                        child: RaisedButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(17.0),
                                                              side: BorderSide(          color: Colors.brown,)
                                                          ),
                                                          color: Colors.brown,


                                                          onPressed: () async{
                                                            snapshot.data.docs[index].reference.update(
                                                                {
                                                                  'name':docu["name"], 'date': docu['date'],'uid': docu['uid'],'docuid':docu['docuid'],"status":"Accepted"
                                                                }
                                                            );
                                                          },
                                                          child: const Text( "Accept",
                                                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                      ButtonTheme(
                                                        minWidth: 110.0,
                                                        height: 45.0,
                                                        child: RaisedButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(17.0),
                                                              side: BorderSide(          color: Colors.brown,)
                                                          ),
                                                          color: Colors.brown,


                                                          onPressed: () async{
                                                            snapshot.data.docs[index].reference.update(
                                                                {
                                                                  'name':docu["name"], 'date': docu['date'],'uid': docu['uid'],'docuid':docu['docuid'],"status":"rejected"
                                                                }
                                                            );
                                                          },
                                                          child: const Text( "Reject",
                                                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));

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
      ),
    );
  }
}
