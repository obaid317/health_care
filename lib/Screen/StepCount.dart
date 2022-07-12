import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}
String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}
class _StepCounterState extends State<StepCounter> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Step Counter'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                radius: 180.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent:  int.parse(_steps)/3000,
                center: new Text(
                  "$_steps",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color:Colors.brown,),
                ),
                backgroundColor: Colors.grey,
                progressColor:  Colors.brown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Step's Taken",style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20.0
                  ,color:  Colors.brown,
              ),)),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("$_steps",style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0
                        ,color:  Colors.brown,
                      ),),
                      Text("Steps Taken out of 3000",style: TextStyle(
                          fontSize: 15.0
                              ,color:  Colors.brown,
                      ),),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text((int.parse(_steps)*0.035).round().toString(),style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30.0
                      ,color:  Colors.brown,
                    ),),
                    Text("Burn Calories",style: TextStyle(
                      fontSize: 12.0,fontWeight: FontWeight.bold
                      ,color:  Colors.brown,
                    ),),
                  ],
                ),
              ),
            ),
            Icon(
              _status == 'walking'
                  ? Icons.directions_walk
                  : _status == 'stopped'
                  ? Icons.accessibility_new
                  : Icons.error,
              size: 50

              ,color:  Colors.brown,
            ),
            Center(
              child: Text(
                  _status,

                  style: TextStyle(fontSize: 10
                    ,color:  Colors.brown,)

              ),
            )
          ],
        ),
      ),
    );
  }
}
