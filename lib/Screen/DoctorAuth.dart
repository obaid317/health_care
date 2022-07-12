
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screen/DoctorDahboard.dart';
import 'package:health_care/Service/AuthService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loading.dart';
import 'PatientHome.dart';
class DoctorAuth extends StatefulWidget {
  @override
  _DoctorAuthState createState() => _DoctorAuthState();
}

class _DoctorAuthState extends State<DoctorAuth> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading= false;
  bool _PasswordShow = true;
  String error = '',about="",phone="";
  String email="",  usertype="";
  String password="";
  String username="";
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        centerTitle: true,
        title: Text("Doctor Authentication"),
        backgroundColor: Colors.brown,

      ),

      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: loading ? Loading() :SingleChildScrollView(
              child: Column(
                children: [

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
                                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
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
                                  labelText: 'Email',

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
                                validator: (val) => val.isEmpty ? 'Enter a valid name' : null,
                                onChanged: (val) {
                                  setState(() => username = val);
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
                                  labelText: 'Username',

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
                                validator: (val) => val.isEmpty ? 'Enter a valid about us' : null,
                                onChanged: (val) {
                                  setState(() => about = val);
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
                                  labelText: 'About',

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
                                validator: (val) => val.isEmpty ? 'Enter a valid phone' : null,
                                onChanged: (val) {
                                  setState(() => phone  = val);
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
                                  labelText: 'phone',

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
                                validator: (val) => val.isEmpty ? 'Enter a Speciality' : null,
                                onChanged: (val) {
                                  setState(() => usertype  = val);
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
                                  labelText: 'Speciality',

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
                                validator: (val) => val.isEmpty ? 'Enter a password' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: _PasswordShow,
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,           color: Colors.brown,),
                                    onPressed: (){
                                      setState(() {
                                        _PasswordShow=!_PasswordShow;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),


                              SizedBox(height: 18,),
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

                                            setState(() => loading = true);
                                            dynamic result;
                                            try{
                                              result = await _auth.signInWithEmailAndPassword(email: email,password: password);
                                              uid=_auth.currentUser.uid;

                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorConsultation(uid)));

                                              //_auth.signOut();
                                             }catch(e){
                                              setState(() => loading = false);
                                              error=e.toString();

                                            }
                                          }

 ,
                                        child: const Text( "Sign In",
                                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),
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
                                          if(_formKey.currentState.validate()){
                                            setState(() => loading = true);
                                            dynamic result;
                                            try{
                                              result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
                                              uid=_auth.currentUser.uid;

                                              Map<String,dynamic> additems ={
                                       'email': email, 'role': "doctor",'uid': uid,'name':username,"speciality":usertype,'about':about,"phone":phone
                                              };
                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                              prefs.setString('uid', uid);
                                              CollectionReference reference = FirebaseFirestore.instance.collection("users");
                                             reference.add(additems);
                                             _auth.signOut();
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DoctorConsultation(uid)));
                                            }catch(e){
                                              setState(() => loading = false);
                                              error=e.toString();

                                            }



                                          }

                                        },
                                        child: const Text("Sign Up",
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
