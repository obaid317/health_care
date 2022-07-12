import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Weight extends StatefulWidget {
  String weight;

  Weight(this.weight);

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {

  String  caloriesin="";

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

                  child:   Text("Weight Chart",style: TextStyle(



                    fontSize: 28,



                    color: Colors.brown,



                    fontWeight: FontWeight.bold,



                  ),),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child:   Center(

                  child:   Text("Weight : "+widget.weight +"kg",style: TextStyle(



                    fontSize: 22,



                    color: Colors.brown,



                    fontWeight: FontWeight.bold,



                  ),),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:68.0),
                child: Center(
                  child:   Text(" ",style: TextStyle(

                    fontSize: 21,

                    color: Colors.brown,

                  ),),
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
                      validator: (val) => val.isEmpty ? 'Enter Weight' : null,
                      onChanged: (val) {
                        setState(() => caloriesin = val);
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
                        labelText: 'Update Weight',
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
                            SharedPreferences pre = await SharedPreferences.getInstance() ;
                            pre.setString("weight", caloriesin);
                            setState(() {
                              widget.weight=caloriesin;
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
