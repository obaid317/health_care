import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loading.dart';
class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  LoadModel();
  }
 String uid;

  int selectedindex =0;
  LoadModel() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  bmrs = await prefs.getString("uid");
    setState(() {
      uid=bmrs;
      print(uid);
    });

  }
  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection("diagnosis").where("uid",isEqualTo: uid);

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body:Column(
         children: [
           Expanded(
             child: StreamBuilder<QuerySnapshot>(
               stream: reference.snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasData){

                   return  ListView.builder(shrinkWrap: true,itemCount: snapshot.data.size,itemBuilder: (context,index){
                     var docu = snapshot.data.docs[index].data();

                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(21)
                         ),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("Heartrate : "+docu["Heartrate"],),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("Symtoms : "+docu["Symtoms"],),
                                 ),

                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("bp : "+docu["bp"],),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text("temprature : "+docu["temprature"],),
                                 ),
                               ],
                             ),
                             // Row(
                             //
                             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                             //
                             //   children: [
                             //
                             //     Text(
                             //
                             //       docu["food"],style: TextStyle(
                             //
                             //       fontSize: 15,
                             //
                             //       fontWeight: FontWeight.w600,
                             //
                             //     ),
                             //
                             //     ),
                             //
                             //     Text(
                             //
                             //       docu["serv"]  ,style: TextStyle(
                             //
                             //       fontSize: 15,
                             //
                             //       fontWeight: FontWeight.w600,
                             //
                             //     ),
                             //
                             //     ),Text(
                             //
                             //       docu["cal"],
                             //
                             //       style: TextStyle(
                             //
                             //         fontSize: 15,
                             //
                             //         fontWeight: FontWeight.w600,
                             //
                             //       ),
                             //
                             //     )
                             //
                             //   ],
                             //
                             // ),
                           ],
                         ),
                       ),
                     );
                   },);
                 }
                 else{
                   return Loading();
                 }
               },
             ),
           ),

         ],
      ),
    );
  }
}
