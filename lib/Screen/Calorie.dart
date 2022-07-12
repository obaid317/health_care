import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Calorie extends StatefulWidget {
  String calorie;

  Calorie(this.calorie);

  @override
  _CalorieState createState() => _CalorieState();
}

class _CalorieState extends State<Calorie> {
String caloriesin="0",calorie="0";
@override
  void initState() {
    // TODO: implement initState
  getuid();
    super.initState();
  }
  void getuid() async {
    SharedPreferences pre = await SharedPreferences.getInstance() ;
int calory = await pre.getInt("cal");
setState(() {
  caloriesin=calory.toString();
});
  }
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
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

                  child:   Text("Calories Chart",style: TextStyle(



                    fontSize: 28,



                    color: Colors.brown,



                    fontWeight: FontWeight.bold,



                  ),),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child:   Center(

                  child:   Text("Daily Calories intake : "+widget.calorie.substring(0,4)+"",style: TextStyle(



                    fontSize: 22,



                    color: Colors.brown,



                    fontWeight: FontWeight.bold,



                  ),),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:68.0),
                child: Center(
                  child:   Text("Today, you consume\n"+"$caloriesin calories",style: TextStyle(

                    fontSize: 21,

                    color: Colors.brown,

                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:58.0,horizontal: 30),
                child: Center(
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: int.parse(caloriesin)/int.parse(widget.calorie),
                    center: Text(int.parse(caloriesin)>0?(int.parse(caloriesin)/int.parse(widget.calorie)).toString().substring(2,4)+"%":"0 %",style: TextStyle(
                        color: Colors.white
                    ),),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.brown,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Form(
key: _formKey,
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 30),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  validator: (val) => val.isEmpty ? 'Enter Calories' : null,
                  onChanged: (val) {
                    setState(() => calorie = val);
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
                    labelText: 'Daily intake of Calories',
                    labelStyle: TextStyle(
                      color:Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 35,vertical: 10),
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
                            SharedPreferences pre =await SharedPreferences.getInstance();
                            pre.setInt("cal", int.parse(calorie));
                            setState(() {
                              caloriesin=calorie;
                            });
                          }


                        },
                        child: const Text( "Update",
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
