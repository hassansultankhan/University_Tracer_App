import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
        title: Text("Selected Universities"),
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
              subtitle: Text(this.UniversityList[countNumber].url +" Serial:"+ this.UniversityList[countNumber].id.toString(), style: TextStyle(color: Colors.black),),
              trailing: Container(
                child:InkWell( 
              child: Icon(Icons.delete),
                onTap: (() => remove(UniversityList[countNumber].id)
                ),
              ),
            ),
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
    remove(int count)async{
      await dbfiles.delete(count);


      // needs to be fixed
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => sortedUniversities()));
      
    }
}