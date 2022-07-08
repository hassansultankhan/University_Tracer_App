import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
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
        ElevatedButton(onPressed: (){}, child: Text('GET DATA'),),
        SizedBox(height: 5,),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
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
}