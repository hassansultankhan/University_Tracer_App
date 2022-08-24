import 'package:flutter/material.dart';
import 'package:universitylist_app/database/dbfiles.dart';


class sortedUniversities extends StatefulWidget {
  const sortedUniversities();

  @override
  State<sortedUniversities> createState() => _sortedUniversitiesState();
}

class _sortedUniversitiesState extends State<sortedUniversities> {
  int universityCount = 0;
  List UniversityList = [];
  var dbfiles = Dbfiles();
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your List"),
        centerTitle: true,
      ),
      body:buildUniversityList(),
      
       

    );
  }

  ListView buildUniversityList(){
   return 
   ListView.builder
      ( itemCount: universityCount,
        itemBuilder: (BuildContext context, int countNumber)
        {
          return Card(
            child: ListTile(
              title: Text(this.UniversityList[countNumber].name,style: TextStyle(color: Colors.black),),
              subtitle: Text(this.UniversityList[countNumber].webadress,style: TextStyle(color: Colors.black),),
            ),

          );
        }
      );

  }
  void getdata()async{
    var universitiesFuture = dbfiles.getuniversities();
    universitiesFuture.then((data) {
      setState(() {
        this.UniversityList= data;
        universityCount = data.length;
      });
    }
    );
    }
}