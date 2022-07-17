import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universitylist_app/detail.dart';
import 'package:universitylist_app/universtiy.dart';

class homescreen extends StatefulWidget {
  homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var country = "Pakistan";
  List<university> unidata = [];
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
              onPressed: () => getdata(),
              child: Text('GET DATA'),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: unidata.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${unidata[index].name}\nState/Province: ${unidata[index].state}',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        onTap: () => details(),
                      ),
                      Container(
                          height: 5,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 150, 135))),
                    ],
                  );
                })
          ],
        ));
  }

  getdata() async {
    var url =
        Uri.parse('http://universities.hipolabs.com/search?country=Pakistan');
    var response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);

    setState(() {
      unidata = university.getuniveritydata(data);
    });
  }
}
