import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading ...';

  // void getData() async {
  //   final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/todos/1'));
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  //   // print('Test');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(time),
      )
    );
  }

  Future<void> setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    print('Hey: '+instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }
}
