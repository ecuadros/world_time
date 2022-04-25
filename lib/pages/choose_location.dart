import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

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
    print('Init state just Starting !');
    getData();
    print('Init state just Finished !');
  }

  @override
  Widget build(BuildContext context) {
    print('Construyendo el Scaffold !');
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Choose a location --'),
        ),
        body: TextButton(
          onPressed: () { setState(() {
            counter += 1;
          });},
          child: Text(' $counter'),
        ),

    );
  }
}
