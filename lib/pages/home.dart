import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic, dynamic> data = {};
  String label = 'Text V2';

  @override
  Widget build(BuildContext context)
  {
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    if(data.containsKey('label') ){
      label = data['label'];
    }
    else{
      label = 'No label !';
    }
    print('Data:'+data.toString());

    // data['isDaytime'] = true;
    // Set background here
    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    Color?  bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    Color?  textColor = data['isDaytime'] ? Colors.indigo : Colors.grey[300];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0.0, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'location': result['location'],
                              'time': result['time'],
                              'isDaytime': result['isDaytime'],
                              'flag': result['flag'],
                            };
                          });
                        },
                        icon: Icon(
                            Icons.edit_location,
                            color: textColor,
                        ),
                        label: Text(
                            label,
                            style: TextStyle(
                              color: textColor,
                            )
                        )
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['location'],
                             style: TextStyle(
                               fontSize: 28.0,
                               letterSpacing: 2.0,
                               color: textColor,
                             )
                        ),
                      ]
                    ),
                    const SizedBox(height: 20.0),
                    Text(data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          letterSpacing: 2.0,
                          color: textColor,
                        )
                    ),
                  ]
                ),
              ),
            )
        )
    );
  }
}