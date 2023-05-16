import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State <ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Athens', flag: 'greece.png', lat: '37.9838', lng: '23.7275'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', lat: '30.0444', lng: '31.2357'),
    WorldTime(location: 'Cappadocia', flag: 'turkey.png', lat: '38.9637', lng: '35.2433'),
    WorldTime(location: 'Chicago', flag: 'usa.png', lat: '41.8781', lng: '87.6298'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', lat: '0.7893', lng: '113.9213'),
    WorldTime(location: 'Kuala Lumpur', flag: 'malaysia.png', lat: '4.2105', lng: '101.9758'),
    WorldTime(location: 'London', flag: 'uk.png', lat: '51.5072', lng: '0.1276'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', lat: '1.2921', lng: '36.8219'),
    WorldTime(location: 'New Zealand', flag: 'auckland.png', lat: '40.9006', lng: '174.8860'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', lat: '35.9078', lng: '127.7669'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text ('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      )
    );
  }
}