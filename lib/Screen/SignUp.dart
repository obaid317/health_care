
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/Service/AuthService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loading.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  double bmi,bmr;
  bool male =true;
  bool female=false;
  bool loading= false;
  bool _PasswordShow = true;
  String error = '';
  String email="";
  String password="";
  String username="",age="",height="",weight="",bgrp="";
  String uid;
  List<String> _locations = ['Basal Metabolic Rate (BMR)','Sedentary: little or no exercise','Light: exercise 1-3 times/week','Active: daily exercise or intense exercise 3-4 times/week','Moderate: exercise 4-5 times/week','Very Active: intense exercise 6-7 times','Extra Active: very intense exercise daily, or physical job']; // Option 2
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.brown,
title: Text("Signup"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: loading ? Loading() :SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height:  MediaQuery.of(context).size.height*0.01,
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:  Container(
                        padding: EdgeInsets.all(12),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter an email id' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),

                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                                validator: (val) => val.isEmpty ? 'Enter a username' : null,
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),

                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Name',

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
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a age' : null,
                                onChanged: (val) {
                                  setState(() => age = val);
                                },

                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color:Colors.brown,width: 3),
                                  ),
                                  labelText: 'Age',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a Weight' : null,
                                onChanged: (val) {
                                  setState(() => weight = val);
                                },

                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Weight',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),

                              TextFormField(
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a blood group' : null,
                                onChanged: (val) {
                                  setState(() => bgrp = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Blood Group',
                                  labelStyle: TextStyle(
                                    color:Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                validator: (val) => val.isEmpty ? 'Enter a Height' : null,
                                onChanged: (val) {
                                  setState(() => height = val);
                                },
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,

                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(          color: Colors.brown,width: 3),
                                  ),
                                  labelText: 'Height in CM',
                                  labelStyle: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              Container(

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.brown,

                                    width: 2,
                                  ) ,                                    borderRadius: BorderRadius.circular(12),
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 2),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButton(
                                          isExpanded: true,

                                          hint: _selectedLocation==null ?Text('Select Activity Level',style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown,
                                          ), overflow: TextOverflow.ellipsis):Text('$_selectedLocation',style: TextStyle(


                                            fontWeight: FontWeight.bold,
                                            color:  Color.fromARGB(255,177,30,36),
                                          ),overflow: TextOverflow.ellipsis,), // Not necessary for Option 1
                                          value: _selectedLocation,
                                          underline: Container(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedLocation = newValue;

                                            });
                                          },
                                          items: _locations.map((location) {
                                            return DropdownMenuItem(
                                              child: new Text(location,style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown,

                                              ),),
                                              value: location,
                                            );
                                          }).toList(),

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 18,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0),
                                child: Row(children: [
                                  Text("Gender",style: TextStyle(
                                    color:  Colors.brown,
                                  ),),
                                  Row(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor:  Colors.brown
                                        ),
                                        child: Checkbox(hoverColor:                 Colors.brown,
                                          activeColor: Colors.transparent,
                                          value: male, onChanged: (checked){
                                            setState((){
                                              male = checked;
                                              female=!male;
                                            });
                                          },  checkColor: Colors.brown,
                                        ),
                                      ),
                                      Text("Male",style: TextStyle(
                                        color: Colors.brown,

                                      ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor:              Colors.brown,
                                        ),
                                        child: Checkbox(value: female,activeColor: Colors.transparent,onChanged: (checked){
                                          setState((){
                                            female = checked;
                                            male=!female;
                                          });
                                        },),
                                      ),
                                      Text("Female",style: TextStyle(
                                        color: Colors.brown,

                                      ),),
                                    ],
                                  ),
                                ],
                                ),
                              ),
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
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: BorderSide(          color: Colors.brown,)
                                        ),
                                        color: Colors.brown,
                                        onPressed: () async{
                                          if(_selectedLocation.isEmpty){
                                            Fluttertoast.showToast(msg: "Select an Activity Level",backgroundColor: Colors.white,textColor:Color.fromARGB(125,232, 29, 130), toastLength: Toast.LENGTH_LONG);

                                          }
                                          if(male){

                                            bmr=(13.397*double.parse(weight) + 4.799*double.parse(height) -(5.677*double.parse(age)) + 88.362) ;
                                            bmi =double.parse(weight)/((0.01*double.parse(height))*(0.01*double.parse(height)));
                                            print("bmi is   "+bmi.toString());
                                            setState(() => loading = true);
                                            dynamic result;
                                            SharedPreferences pre = await SharedPreferences.getInstance() ;
                                            pre.setString("bmr", bmr.toString());
                                            pre.setString("bmi", bmi.toString());
                                            pre.setInt("cal", 0);
                                            pre.setInt("water", 0);
                                            pre.setString("date", DateTime.now().toString().substring(1,10));

                                            result = await auth.registerWithEmailAndPassword(email, password, username,age,height,bgrp,weight,"male",_selectedLocation,bmr.toString(), context);
                                            if(result==null){
                                              setState(() {
                                                loading=false;
                                                error= auth.displayerror();
                                              });
                                            }else{

                                            }
                                          }else{
                                            bmr=(9.247*double.parse(weight) + 3.098*double.parse(height) -( 4.330*double.parse(age)) + 447.593) ;
                                            bmi =double.parse(weight)/((0.01*double.parse(height))*(0.01*double.parse(height)));
                                            print("bmi is   "+bmi.toString());
                                            setState(() => loading = true);
                                            dynamic result;
                                            SharedPreferences pre = await SharedPreferences.getInstance() ;
                                            pre.setString("bmr", bmr.toString());
                                            pre.setString("bmi", bmi.toString());
                                            result = await auth.registerWithEmailAndPassword(email, password, username,age,height,bgrp,weight,"female",_selectedLocation,bmr.toString(), context);
                                            if(result==null){
                                              setState(() {
                                                loading=false;
                                                error= auth.displayerror();
                                              });
                                            }else{

                                            }

                                          }



                                        },
                                        child: const Text("Sign UP",
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
