import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time = ''; //the time in that location
  String flag ; //url to an asset flag icon
  String lat ; //latitude of the location
  String lng ; //langitude of te location
  bool isDayTime = true; //true or false if daytime or not

  final apiKey = 'XP6ETXF5X42O';

  WorldTime({ required this.location, required this.flag, required this.lat, required this.lng});


  Future<void> getTime() async {

    try {
      //make the request
    final response = await http.get(Uri.parse(
      'http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=position&lat=$lat&lng=$lng'));
    Map data = jsonDecode(response.body);
    //print(data);
    
    //get properties from data
    String datetime = data['formatted'];
    String offset = data['dst'];
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time properties
    isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('Caught error : $e');
      time = 'Could not get the time data';

    }
    
  
  }

}

