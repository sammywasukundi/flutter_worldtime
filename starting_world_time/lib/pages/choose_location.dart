import 'package:flutter/material.dart';
import 'package:starting_world_time/services/world_time.dart';
// import 'package:starting_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> Locations = [
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'usa.png'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'england.png'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(location: 'Monrovia', url: 'Africa/Monrovia', flag: 'liberia.png'),
    WorldTime(location: 'Maputo', url: 'Africa/Maputo', flag: 'botswana.png'),
    WorldTime(location: 'Tripoli', url: 'Africa/Tripoli', flag: 'libye.png'),
    WorldTime(location: 'Dubai', url: 'Asia/Dubai', flag: 'dubai.png'),
    WorldTime(location: 'Paris', url: 'Europe/Paris', flag: 'france.png'),
    WorldTime(location: 'Prague', url: 'Europe/Prague', flag: 'tcheque.png'),
    // Ajoutez d'autres emplacements avec leurs URLs ici
  ];

  void updateTime(index) async {
    WorldTime instance = Locations[index];
    await instance.getTime();
    // navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    //print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 16, 182),
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: Locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(Locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${Locations[index].flag}'),
                ),
              ),
            )

          );
        },
      ),
    );
  }
}