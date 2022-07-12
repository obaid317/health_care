import 'package:flutter/material.dart';
class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Emergency",style: TextStyle(
              color: Colors.brown,
              fontSize: 22,

            ),),
Expanded(
  child:   ListView.builder(
    shrinkWrap: true,
      itemCount: 7,itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(13),
        ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
            children: [
               Row(
                 children: [
                   Text("Hospital no "+index.toString())
                 ],
               ),
              Row(
                children: [
                  Text("Address "+index.toString())
                ],
              )
              ,
            ],
          ),
       )
      ),
    );
  }),
)
          ],
        ),
      ),
    );
  }
}
