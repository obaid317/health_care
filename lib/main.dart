import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'Screen/PatientHome.dart';
import 'Screen/Wellcome.dart';
import 'Service/AuthService.dart';

Future<void> main()
async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AuthService a = AuthService();
return
  runApp(MaterialApp(

  home: FutureBuilder(
    future: a.getCurrentUser(),
    builder:(context, AsyncSnapshot<dynamic> snapshot){
      if(snapshot.hasData){
        return PatientDashboard();
      }
      else{
        return SplashScreen();
      }
    },),
  debugShowCheckedModeBanner: false,
));}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Timer(Duration(seconds: 4), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wellcome())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:18.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Welcome to the ",style: TextStyle(
                        color: Colors.brown,
                        fontSize: 23,
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Dock It",style: TextStyle(
                        color: Colors.brown,
                        fontSize: 38,

                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: 8,),

            Container(
              height: 40,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat, /// Required, The loading type of the widget
                colors: const [Colors.black],       /// Optional, The color collections
                color: Colors.black,
              ),
            )
          ],
        ),
      ),

    );
  }
}

