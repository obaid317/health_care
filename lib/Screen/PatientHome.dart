import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screen/Account.dart';
import 'package:health_care/Screen/Calorie.dart';
import 'package:health_care/Screen/Consultant.dart';
import 'package:health_care/Screen/Hydration.dart';
import 'package:health_care/Screen/PhysicalFitness.dart';
import 'package:health_care/Screen/StepCount.dart';
import 'package:health_care/Screen/Weight.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hello.dart';
import 'Loading.dart';
class PatientDashboard extends StatefulWidget {
  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {

 String name="c",bmr="1999",weight="99",uid="";

 @override
  void initState() {
   getValues(); // TODO: implement initState
    super.initState();

 }
 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
 void  getValues() async{
   SharedPreferences pre = await SharedPreferences.getInstance() ;

String     names= await pre.getString("name");
String     bmrs= await pre.getString("bmr");
String    weights= await pre.getString("weight");
   String    uids= await pre.getString("uid");
String dates =await pre.getString("date");
if(DateTime.now().toString().substring(1,10)!=dates){
  pre.setInt("cal", 0);
  pre.setInt("water", 0);
  pre.setString("date", DateTime.now().toString().substring(1,10));

}
 setState(() {

   uid=uids;
    bmr=bmrs.substring(0,4);
   weight=weights;
  name=names;
 });
print("uid"+uid);
 }
 int selectedindex =0;
 onITEMTAP(int index){
   setState(() {
     print(index);
     selectedindex=index;
   });
 }
  @override
  Widget build(BuildContext context) {

    Query reference = FirebaseFirestore.instance.collection("appointment").where('uid',isEqualTo: "9WeFBgun8wb6nTEFgDGYWtw3Anz1");
    final List<Widget> widgets =[
      SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Hi $name",style: TextStyle(

                      color: Colors.brown,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,

                    ),),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child:
                    IconButton(icon: Icon(Icons.notifications_on),iconSize: 23,)),
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Metric's",style: TextStyle(

                      color: Colors.brown,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,

                    ),),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    GridView.builder( shrinkWrap: true,
                      primary: true,
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context,int index){
                        if(index==0) {
                          return GestureDetector(
                            onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Calorie(bmr)));
                            },
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Text("Calories",style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                      Text(bmr,style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }else
                        if(index==1) {
                          return GestureDetector(
                            onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Weight(weight)));
                            },
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Text("Weight",style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                      Text(weight,style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        if(index==2) {
                          return GestureDetector(
                            onTap: (){
                              print(bmr);
                              String a=(int.parse(weight)*0.033).toString();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Water(a)));
                            },
                            child:Container(
                              height: 100,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Text("Water",style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                      Text((int.parse(weight)*0.033).toString().substring(0,3)+" lt",style: TextStyle(

                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        return GestureDetector(
                          onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>StepCounter()));
                          },
                          child:Container(
                            height: 100,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("Step Count",style: TextStyle(

                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,

                                    ),),
                                    Text("",style: TextStyle(

                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,

                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                      },
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      Hellll(uid),
    PhysicalFitness(),
      SafeArea(
        child: Consultant(),
      ),
      Account(),
    ];

    return Scaffold(
      backgroundColor: Colors.white38.withOpacity(0.9),

      body: widgets.elementAt(selectedindex),
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor:  Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: onITEMTAP,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,                  ),
            label: "Home"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
              label: "Appointments"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
              label: "fitness"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
              label: "Menu"
          ), BottomNavigationBarItem(
            icon: Icon(Icons.person),
              label: "Account"
          ),
        ],


      ),
    );
  }
}
