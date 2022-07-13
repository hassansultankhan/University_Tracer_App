import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universitylist_app/universtiy.dart';

class homescreen extends StatefulWidget {
  homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<university> universitydata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Univerity Tracer'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () => getData(),
              child: Text('GET DATA'),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: universitydata.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text('${universitydata[index].name}'),
                          // Text('${universitydata[index].webad}'),
                          // Text('${universitydata[index].state}'),
                        ],
                      )
                    ],
                  );
                }),
          ],
        ));
  }

  getData() async {
    var url =
        // Uri.parse('https://api.zippopotam.us/us/33162');
        Uri.parse('http://universities.hipolabs.com/search?country=Pakistan');
    var response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    //print(data['country']);

    setState(() {
      universitydata = university.getuniveritydata(data);
    });
  }
}
