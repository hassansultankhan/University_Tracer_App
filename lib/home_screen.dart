import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universitylist_app/detail.dart';
import 'package:universitylist_app/login.dart';
import 'package:universitylist_app/universtiy.dart';

class homescreen extends StatefulWidget {
  String countryName = "";
  homescreen(this.countryName);
  @override
  State<homescreen> createState() => _homescreenState();
}
class _homescreenState extends State<homescreen> {
  // String? countryName;
  // _homescreenState(this.countryName);
  
  List<university> unidata = [];
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('UNIVERSITY TRACER'),
          centerTitle: true,
          elevation: 5.0,
          // leading:
          actions: <Widget>[IconButton(
              onPressed: () => logout(), icon: Icon(Icons.exit_to_app_rounded),
              iconSize: 27,padding: EdgeInsets.only(right: 10.0),),
          ]
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            // ElevatedButton(
            //   style: ButtonStyle(
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18.0),
            //         side: BorderSide(
            //           color: Color.fromARGB(255, 170, 194, 34),
            //           width: 2.0,
            //         ),
            //       ),
            //     ),
            //   ),
            //   onPressed: () => getdata(),
            //   child: Text('GET DATA'),
            // ),
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
                        onTap: () => move(unidata[index]),
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
    var countryPointer =widget.countryName.toString();
    var url =
        Uri.parse('http://universities.hipolabs.com/search?country=$countryPointer');
    var response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);

    setState(() {
      unidata = university.getuniveritydata(data);
    });
  }

  move(university U) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => details(U)));
  }

  void logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const loginpage(),
        ),
        (Route<dynamic> route) => false);

    // await prefs.setBool('login', false);
    // await prefs.remove('login');
    // prefs.clear() delete all key value pairs
    // prefs.remove('LOGIN) delete single key value pairs
  }
}
