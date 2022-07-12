
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Service/AuthService.dart';

import 'Loading.dart';
import 'PatientHome.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading= false;
  bool _PasswordShow = true;
  String error = '';
  String email="";
  String password="";
  String username="";
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        centerTitle: true,
        title: Text("Sign IN"),
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

                                          if(_formKey.currentState.validate()){
                                            setState(() => loading = true);
                                            dynamic result;

                                            result = await auth.signInWithEmailAndPassword(email, password);

                                            if(result==null){
                                              setState(() {
                                                loading=false;
                                                error= auth.displayerror();
                                              });
                                            }else{
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>PatientDashboard()));


                                            }
                                          }


                                        },
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
