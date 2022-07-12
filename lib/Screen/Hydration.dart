import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Water extends StatefulWidget {
  String water;
  @override
  _WaterState createState() => _WaterState();

  Water(this.water);
}

class _WaterState extends State<Water> {
  int waterconsumpt=0,value=0;
  @override
  void initState() {
    getinfo();
    // TODO: implement initState
    super.initState();
  }
  void getinfo()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int wat = pref.getInt("water");
    setState(() {
      waterconsumpt=wat;
     value= int.parse(widget.water)*1000;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back,color: Colors.brown,), onPressed: (){
                  Navigator.pop(context);
                }),
              ],
            ),
            Padding(
  padding: const EdgeInsets.only(top:8.0),
  child:   Center(

    child:   Text("Hydration",style: TextStyle(



      fontSize: 28,



      color: Colors.brown,



      fontWeight: FontWeight.bold,



    ),),

  ),
),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child:   Center(

                child:   Text("Daily water intake : "+widget.water.substring(0,3)+"L",style: TextStyle(



                  fontSize: 22,



                  color: Colors.brown,



                  fontWeight: FontWeight.bold,



                ),),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:68.0),
              child: Center(
                child:   Text("Today, you took\n"+waterconsumpt.toString()+" ml of water",style: TextStyle(

                  fontSize: 21,

                  color: Colors.brown,

                ),),
              ),
            ),

SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                IconButton(icon: Icon(Icons.add,color: Colors.brown,), onPressed: () async{
SharedPreferences pref = await SharedPreferences.getInstance();
int wate = pref.getInt("water");
setState(() {
  waterconsumpt= waterconsumpt+250;
});
pref.setInt("water", waterconsumpt);
                }),
Image(image: AssetImage("assets/glasssss.jpg",),height: 70,),
                IconButton(icon: Icon(Icons.minimize,color: Colors.brown,),onPressed: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  int wate = pref.getInt("water");
                  setState(() {
                    waterconsumpt= waterconsumpt-250;
                  });
                  pref.setInt("water", waterconsumpt);
                }),

              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top:68.0),
              child: Center(
                child:   Text("One glass of water contain 250ml of water",style: TextStyle(

                  fontSize: 16,

                  color: Colors.brown,

                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
