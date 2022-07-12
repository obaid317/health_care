import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.brown,
          size: MediaQuery.of(context).size.height*0.2,
        ),
      ),
    );
  }
}
