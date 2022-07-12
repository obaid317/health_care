import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:health_care/Screen/DoctorProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loading.dart';
class Consultant extends StatefulWidget {
  const Consultant({Key key}) : super(key: key);

  @override
  _ConsultantState createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  Query reference = FirebaseFirestore.instance.collection("users").where('role',isEqualTo: 'doctor');
CollectionReference references = FirebaseFirestore.instance.collection("appointment");
String name="",datess="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 20),
              child: Text("Available Doctors",style: TextStyle(
                 color: Colors.brown,
                fontSize: 22,
              ),),
            ),

            Expanded(


              child:StreamBuilder<QuerySnapshot>(


                  stream: reference.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                    if(snapshot.hasData) {
                      return
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                           ),
                          child: Column(
                            children: [


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
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfile(uid: docu["uid"],name: docu["name"],about: docu["about"],phone: docu['phone'],speciality: docu["speciality"],)));
//                                           showDialog(context: context,builder: (context)=>Dialog(
//                                             child: SingleChildScrollView(
//                                               //    scrollDirection: Axis.horizontal,uid
//                                            child: Container(
//                                              height: 200,
//                                              child:  Column(
//                                                children: [
//                                                  Form(
//                                                child:  Column(
//                                                  children: [
//                                                    Padding(
//                                                      padding: const EdgeInsets.all(8.0),
//                                                      child: TextFormField(
//                                                        maxLines: 1,
//                                                        validator: (val) => val.isEmpty ? 'Enter a Name' : null,
//                                                        onChanged: (val) {
//                                                          setState(() => name= val);
//                                                        },
//                                                        style: TextStyle(
//                                                          color: Colors.brown,
//                                                        ),
//                                                        decoration: InputDecoration(
//                                                          fillColor: Colors.white,
//
//                                                          border: OutlineInputBorder(),
//                                                          enabledBorder: OutlineInputBorder(
//                                                            borderRadius: BorderRadius.all(Radius.circular(22.0)),
//                                                            borderSide: BorderSide(          color: Colors.brown,width: 3),
//                                                          ),
//                                                          labelText: 'Name',
//                                                          labelStyle: TextStyle(
//                                                            color:Colors.brown,
//                                                            fontSize: 18,
//                                                            fontWeight: FontWeight.bold,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    TextButton(
//                                                          onPressed: () {
//                                                            DatePicker.showDateTimePicker(context, showTitleActions: true,
//                                                                onChanged: (date) {
//                                                                  print('change $date in time zone ' +
//                                                                      date.timeZoneOffset.inHours.toString());
//                                                                }, onConfirm: (date) {
//                                                                 datess=date.toString();
//                                                                }, currentTime: DateTime(2022, 6, 18, 00, 00, 00));
//                                                          },
//                                                          child: Text(
//                                                            'Select Date and time',
//                                                            style: TextStyle(color: Colors.brown),
//                                                          )),
//                                                    ButtonTheme(
//                                                      minWidth: 110.0,
//                                                      height: 45.0,
//                                                      child: RaisedButton(
//                                                        shape: RoundedRectangleBorder(
//                                                            borderRadius: BorderRadius.circular(17.0),
//                                                            side: BorderSide(          color: Colors.brown,)
//                                                        ),
//                                                        color: Colors.brown,
//
//
//                                                        onPressed: () async{
//                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
//                                                      String uid=await prefs.getString("uid");
//                                                          Map<String,dynamic> additems ={
//                                                            'name': name, 'date': datess,'uid': uid,'docuid':docu['uid'],"status":"pending"
//                                                          };
// references.add(additems);
// Navigator.pop(context);
//                                                        },
//                                                        child: const Text( "Confirm",
//                                                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                                                        ),
//                                                      ),
//                                                    ),
//
//                                                  ],
//                                                ),)
//                                                ],
//                                              ),
//                                            ),
//                                             ),
//                                           ));

                                        },
                                        child: Container(

                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.grey[200]),

                                          ),
                                          child:  Container(
                                            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            padding: EdgeInsets.all(5.0),

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                    Image.asset('assets/DoctorProfile.png',height: 80,width: 80,),
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
                                                            Text(docu['speciality'],  style: TextStyle(
                                                              fontWeight: FontWeight.bold,

                                                            ),
                                                            ),
                                                             SizedBox(height: 6,),
                                                            SizedBox(height: 6,),

                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(icon: Icon(Icons.arrow_right_alt,color: Colors.blue,) ),
                                                ],
                                              ),
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
                        )
                        // Container(
                        //   child:  ListView.builder(shrinkWrap: true, itemCount: snapshot.data.size , itemBuilder: (context, index) {
                        //     var docu = snapshot.data.docs[index].data();
                        //     return Padding(
                        //       padding: const EdgeInsets.all(11.0),
                        //       child: GestureDetector(
                        //         onTap: (){
                        //       //    Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp(titt: docu["tittle"],desc: docu['description'],reps: docu['Reps'],rests: docu['Rests'],sets: docu['Sets'],vurl: docu['videos'],)));
                        //         },
                        //         child: Container(
                        //
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(12),
                        //               color: Colors.white,
                        //
                        //             ),
                        //             child:Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Column(
                        //                 children: [
                        //                   Center(
                        //                     child: Text(docu['tittle'],style: TextStyle(
                        //                       fontWeight: FontWeight.bold,
                        //                       fontSize: 20,
                        //                     ),),
                        //                   ),
                        //                   Row(
                        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       Padding(
                        //                         padding: const EdgeInsets.all(8.0),
                        //                         child: Column(
                        //                           mainAxisAlignment: MainAxisAlignment.start,
                        //                           crossAxisAlignment: CrossAxisAlignment.start,
                        //                           children: [
                        //                             Text("Reps",style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 15,
                        //                             ),),
                        //                             Text(docu['Reps'],style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 12,
                        //                             ),),
                        //                             Padding(
                        //                               padding: const EdgeInsets.only(top: 5),
                        //                               child: Text("Sets",style: TextStyle(
                        //                                 fontWeight: FontWeight.bold,
                        //                                 fontSize: 15,
                        //                               ),),
                        //                             ),
                        //                             Padding(
                        //                               padding: const EdgeInsets.only(top: 5),
                        //                               child: Text(docu['Sets'],style: TextStyle(
                        //                                 fontWeight: FontWeight.bold,
                        //                                 fontSize: 12,
                        //                               ),),
                        //                             ),
                        //                             Padding(
                        //                               padding: const EdgeInsets.only(top: 5),
                        //                               child: Text("Rest",style: TextStyle(
                        //                                 fontWeight: FontWeight.bold,
                        //                                 fontSize: 15,
                        //                               ),),
                        //                             ),
                        //                             Text(docu['Rests'],style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 12,
                        //                             ),),
                        //                           ],                            ),
                        //                       ),
                        //                       Container(
                        //                         height: 110,
                        //                         width: 220,
                        //                         decoration: BoxDecoration(
                        //                           image: DecorationImage(
                        //                             image: NetworkImage(docu['image'],),
                        //                             fit: BoxFit.cover,
                        //
                        //                           ),
                        //                           borderRadius: BorderRadius.circular(22),
                        //                         ),
                        //
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ],
                        //
                        //               ),
                        //             )
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   ),
                        // );
;


                    }

                    else{
                      return Loading();
                    }

                  }),


            )



          ],
        ),
      ),
    );
  }
}
