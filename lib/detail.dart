import 'package:flutter/material.dart';
import 'package:universitylist_app/universtiy.dart';

class details extends StatelessWidget {
  university universitydetail;
  details(this.universitydetail);
  TextStyle detailStyle = TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Color.fromARGB(255, 215, 109, 27));
   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    appBar: AppBar( 
      title: Text('University Detail'),
      centerTitle: true,
    ),
    
    body:Container(

      child: Column(
        children: [
          Container(height: 20,),
          Text(universitydetail.name,style: detailStyle,),
          Container(height: 10,),
          Text('${universitydetail.webad}', style: detailStyle,),
          Container(height: 10,),
          if (universitydetail.state != null)
          Text(universitydetail.state) 
          else(
            const Text('Location data not available')
          ),
          Container(height: 10),
          ElevatedButton
          (onPressed: ()=> Navigator.pop(context),
          child: Text(
            'Back to Main Page'
                      ),
          ),

        ],
      ),

    ),
    );
  }

  }

