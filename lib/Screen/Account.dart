import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Service/AuthService.dart';
import 'package:health_care/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String uid,photo="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",name=" ",email=" ",country=" ",coin=" ",weight=" ",bgroup="",phone=" ",age=" ",height=" ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuid();
  }
  void getuid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    var collection = await FirebaseFirestore.instance.collection('users').where(
        'uid', isEqualTo: uid);
    var querySnapshot = await collection.get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = await queryDocumentSnapshot.data();
      setState(() {
        photo=  data['photos'];
        email=data['email'];
        name=data['username'];
        weight=data['weight'];
        bgroup=data['bldgrp'];
         age=data['age'];
        height=data['height'];

      });


    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16,top: 25,right:16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(

                    children: [
                      Text('Account Info',style: TextStyle(
                          fontSize: 25,fontWeight: FontWeight.w500
,                        color: Colors.brown,

                      ),),


                      SizedBox(width: 5,),

                    ],


                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:28,left:8),
                    child: Container(
                      decoration: BoxDecoration(
color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email Address',style: TextStyle(
                                fontSize: 12,fontWeight: FontWeight.w300
                            ),

                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(email,style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:28,left:8),
                    child: Container(
                      decoration: BoxDecoration(
color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('User Name',style: TextStyle(
                                fontSize: 12,fontWeight: FontWeight.w300
                            ),

                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(name,style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:28,left:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age',style: TextStyle(
                                fontSize: 12,fontWeight: FontWeight.w300
                            ),

                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(age,style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:28,left:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Group',style: TextStyle(
                                fontSize: 12,fontWeight: FontWeight.w300
                            ),

                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(bgroup,style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:28,left:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Weight',style: TextStyle(
                                fontSize: 12,fontWeight: FontWeight.w300
                            ),

                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(weight,style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                   onTap: (){
                     AuthService auth = AuthService();
                     auth.signOut();
                     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SplashScreen()));
                   },
                    child: Padding(
                      padding: const EdgeInsets.only(top:28,left:8),
                      child: Container(
                        decoration: BoxDecoration(
color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              SizedBox(
                                height: 8,
                              ),
                              Text("Log Out",style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 500,),
            // GestureDetector(child: Text("Psychologist"),
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>PsychPanel()));
            // },),
          ],
        ),
      ),
    );


  }
}
