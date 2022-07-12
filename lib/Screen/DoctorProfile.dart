import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
class DoctorProfile extends StatefulWidget {
  String name,speciality,about,phone,uid;

  DoctorProfile({this.name, this.speciality, this.about, this.phone, this.uid});

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {


  CollectionReference references = FirebaseFirestore.instance.collection("appointment");
  String name="",datess="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset("assets/doctor.jpg"),
            Padding(
              padding: const EdgeInsets.only(top:12.0,left:12),
              child: Row(
                children: [
                  Text(widget.name,style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,

                  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:4.0,left:12),
              child: Row(
                children: [
                  Text(widget.speciality,style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,

                  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:24.0,left:12),
              child: Row(
                children: [
                  Text("About",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,

                  ),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:24.0,left:12,right: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width*1,
                  child: Text(widget.about,style: TextStyle(
                    fontSize: 17, 

                  ),),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.phone,color: Colors.black, size: 30,),onPressed: ()async{
            launch('tel: '+widget.phone);
                  }, ),
                  IconButton(icon: Icon(Icons.message,color: Colors.black, size: 30,)
                  ,onPressed: (){
                       launch('sms: '+widget.phone);
                    },

                  ),
                  GestureDetector(
                    onTap: (){
                                                                showDialog(context: context,builder: (context)=>Dialog(
                                            child: SingleChildScrollView(
                                              //    scrollDirection: Axis.horizontal,uid
                                           child: Container(
                                             height: 200,
                                             child:  Column(
                                               children: [
                                                 Form(
                                               child:  Column(
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: TextFormField(
                                                       maxLines: 1,
                                                       validator: (val) => val.isEmpty ? 'Enter a Name' : null,
                                                       onChanged: (val) {
                                                         setState(() => name= val);
                                                       },
                                                       style: TextStyle(
                                                         color: Colors.brown,
                                                       ),
                                                       decoration: InputDecoration(
                                                         fillColor: Colors.white,

                                                         border: OutlineInputBorder(),
                                                         enabledBorder: OutlineInputBorder(
                                                           borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                                           borderSide: BorderSide(          color: Colors.brown,width: 3),
                                                         ),
                                                         labelText: 'Name',
                                                         labelStyle: TextStyle(
                                                           color:Colors.brown,
                                                           fontSize: 18,
                                                           fontWeight: FontWeight.bold,
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   TextButton(
                                                         onPressed: () {
                                                           DatePicker.showDateTimePicker(context, showTitleActions: true,
                                                               onChanged: (date) {
                                                                 print('change $date in time zone ' +
                                                                     date.timeZoneOffset.inHours.toString());
                                                               }, onConfirm: (date) {
                                                                datess=date.toString();
                                                               }, currentTime: DateTime(2022, 6, 18, 00, 00, 00));
                                                         },
                                                         child: Text(
                                                           'Select Date and time',
                                                           style: TextStyle(color: Colors.brown),
                                                         )),
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
                                                         SharedPreferences prefs = await SharedPreferences.getInstance();
                                                     String uid=await prefs.getString("uid");
                                                         Map<String,dynamic> additems ={
                                                           'name': name, 'date': datess,'uid': uid,'docuid':widget.uid,"status":"pending"
                                                         };
references.add(additems);
Navigator.pop(context);
                                                       },
                                                       child: const Text( "Confirm",
                                                         style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                       ),
                                                     ),
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
                      width: 150,
                      decoration: BoxDecoration(

                        color: Colors.black,
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Appointment ",style: TextStyle(
                            fontSize: 15,
fontWeight: FontWeight.bold,color: Colors.white
                          ),),
                        ),
                      ),),
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
