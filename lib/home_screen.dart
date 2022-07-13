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
  var country = "Pakistan";
   List<university> unidata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: const Text('Univerity Tracer'),
        centerTitle: true,
        elevation: 0,
      ),


      body: ListView(
        
       children: [
        SizedBox(height: 5,),
        ElevatedButton(onPressed: ()=>getdata(), child: Text('GET DATA'), ),
        SizedBox(height: 5,),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: unidata.length,
          itemBuilder: (context, index){
          
          return Column(
            children: [],
          );
        }
        )
       ],
      ) 
    );
  }

  getdata()async{
    var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
    var response =await  http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

  setState(() {
      unidata = university.getuniveritydata(data);
    });
    
  }
}