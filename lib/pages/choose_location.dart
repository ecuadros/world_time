import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

   void updateTime(int index) async
   {
     WorldTime instance = locations[index];
     await instance.getTime();
     Navigator.pop(context, {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDaytime': instance.isDaytime,
     });
   }
   void getData() async {
     String str = await Future.delayed( const Duration(seconds: 3),
             (){ String str = 'Tito 3 seconds ...';
                print(str);
                return str;
             } );
     Future.delayed( const Duration(seconds: 2),
             (){
           print('Tito 2 seconds ...');
         } );

     print('Terminó !');
   }
  int counter = 0;
  @override
  void initState() {
    super.initState();
    // print('Init state just Starting !');
    // getData();
    // print('Init state just Finished !');
  }

  @override
  Widget build(BuildContext context) {
    // print('Construyendo el Scaffold !');
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Choose a location --'),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text( locations[index].location ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                )
              ),
            );
          },
        ),
        // body: TextButton(
        //   onPressed: () { setState(() {
        //     counter += 1;
        //   });},
        //   child: Text(' $counter'),
        // ),
    );
  }
}
