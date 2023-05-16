import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State <Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'London', 
      flag: 'london.png', 
      lat: '51.5072', 
      lng: '0.1276'
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();  
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blue[900],
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Wait for a moment..',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}

}