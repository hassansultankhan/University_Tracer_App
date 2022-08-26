import 'package:flutter/material.dart';
import 'package:universitylist_app/database/dbfiles.dart';
import 'package:universitylist_app/database/likeduniversity.dart';
import 'package:universitylist_app/database/sortedUniversities.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'click.dart';

class webview_widget extends StatefulWidget {
  String website = "";
  String uniname = "";
  webview_widget(this.website, this.uniname);

  @override
  State<webview_widget> createState() => _webview_widgetState();
}

class _webview_widgetState extends State<webview_widget> {
  double progress = 0.0;
   var dbfiles = Dbfiles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.uniname),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: ()async{ 
              click(widget.uniname, context);
              String name = widget.uniname;
              String webadress = widget.website;
              likedUniversity likedUni = likedUniversity(name,webadress);
              var result = await dbfiles.insert(likedUni);
             
            },
            icon: Icon(
              Icons.playlist_add,
              color: Colors.blue,
            ),
            iconSize: 30,
            padding: EdgeInsets.only(
              // right: 10,
            ),
          ),
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => sortedUniversities(),));
          }, 
          icon: Icon(
            Icons.playlist_add_check,
             color: Colors.blue,
            ),
            iconSize: 30,
            padding: EdgeInsets.only(
          ) 
          ),
        ],
      ),
      body: Column(children: [
        LinearProgressIndicator(
          backgroundColor: Color.fromARGB(255, 245, 218, 250),
          color: Color.fromARGB(255, 172, 5, 244),
          value: progress,
        ),
        Container(
            child: Expanded(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            zoomEnabled: true,
            initialUrl: widget.website,
            onProgress: (progress) =>
                setState(() => (this.progress = progress / 100)),
          ),
        )),
      ]),
    );
  }
  
}
