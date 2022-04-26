import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldTime {

  String location; // location name for the UI
  String time = '';     // The time in that location
  String flag;     // URL to an asset flag icon
  String url;      // Location URLfor API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async
  {
    try {
      final response = await http.get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      // print(data);
      print(data['datetime']);
      // print('utc_offset: '+data['utc_offset']);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      //now.add(Duration())
      //print(now);

      // Set the time property
      time = DateFormat.jm().format(now);
    }
    catch(e) {
        print('Error caught: ---$e---');
        time = 'Error caught !';
    }
  }
}