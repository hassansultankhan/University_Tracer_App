import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universitylist_app/detail.dart';
import 'package:universitylist_app/login.dart';
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
              
              style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                      color: Color.fromARGB(255, 170, 194, 34), 
                      width: 2.0,
                  ),
              ),
          ),
      ),
              onPressed: () => getdata(),
              child: Text('GET DATA'),
            ),
            SizedBox(
              height: 5,
            ),

            ElevatedButton(onPressed: ()=>logout() , child: Text('LOG OUT'),),
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
    var url =
        Uri.parse('http://universities.hipolabs.com/search?country=Pakistan');
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

  void logout()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const loginpage(),), (Route<dynamic>route) => false);

    // await prefs.setBool('login', false);
    // await prefs.remove('login');
     // prefs.clear() delete all key value pairs
    // prefs.remove('LOGIN) delete single key value pairs
  }
}
