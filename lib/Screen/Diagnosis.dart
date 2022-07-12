import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Service/AuthService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loading.dart';
import 'PatientHome.dart';
class Diagnosis extends StatefulWidget {
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  final _formKey = GlobalKey<FormState>();

  bool loading= false;
  bool _PasswordShow = true;
  String error = '';
  String bp="";
  String heartrate="";
  String temprature="";
  String Symtoms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        centerTitle: true,
        title: Text("SignIN"),
        backgroundColor: Colors.brown,

      ),

      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: loading ? Loading() :SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height:  MediaQuery.of(context).size.height*0.1,
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child:  Container(
                        padding: EdgeInsets.all(12),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a valid blood pressure' : null,
                                onChanged: (val) {
                                  setState(() => bp = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                    borderSide: BorderSide(             color:Colors.brown,width: 3),
                                  ),
                                  labelText: 'BP',

                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 26,),


                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a tempratue' : null,
                                onChanged: (val) {
                                  setState(() => temprature = val);
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
                                  labelText: 'Temprature',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),


                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a heart rate' : null,
                                onChanged: (val) {
                                  setState(() => heartrate = val);
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
                                  labelText: 'Heart Rate',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              SizedBox(height: 18,),


                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a Symtom' : null,
                                onChanged: (val) {
                                  setState(() => Symtoms = val);
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
                                  labelText: 'Symtoms',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric( horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          String  bmrs = await prefs.getString("uid");
                                          if(_formKey.currentState.validate()) {
Map<String,dynamic> a={
  "bp":bp,"temprature":temprature,"Heartrate":heartrate,"Symtoms":Symtoms,"date":DateTime.now(),"uid":bmrs,
};
CollectionReference reference =FirebaseFirestore.instance.collection("diagnosis");
await reference.add(a);
                                          }

                                        },
                                        child: const Text( "Submit",
                                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.027),
                                child: Text(error, style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
