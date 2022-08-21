import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universitylist_app/login.dart';
import 'package:universitylist_app/universtiy.dart';
import 'package:universitylist_app/webview.dart';

class details extends StatefulWidget {
  university universitydetail;
  details(this.universitydetail);
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  TextStyle stylepointer = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 112, 33, 208));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Detail'),
        centerTitle: true,
        elevation: 5.0,

         actions: <Widget>[IconButton(
              onPressed: () => logout(), icon: Icon(Icons.logout_rounded),
              iconSize: 27,padding: EdgeInsets.only(right: 10.0),),
          ]

      ),
      body: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 54, 28, 76),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                BlendMode.srcATop),
            image: AssetImage("assets/hallway.jpg"),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            Text(widget.universitydetail.name, style: stylepointer),
            Container(
              height: 20,
            ),
            if (widget.universitydetail.state != null)
              Text(widget.universitydetail.state,
                  style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ))
            else
              (const Text('Location data not available')),
            Container(
              height: 20,
            ),
            ElevatedButton(
              child: Text(
                'Weblink -> ${widget.universitydetail.webad}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              onPressed: () => openWebView(
                  widget.universitydetail.webad, widget.universitydetail.name),
            ),
            Container(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Explore other Universities"),
            ),
          ],
        ),
      ),
    );
  }

  openWebView(dynamic websiteAddress, String uniname) {
    String webAdTostring = websiteAddress.toString();
    int length = webAdTostring.length;
    String trimmedAdress = webAdTostring.substring(1, length - 1);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => webview_widget(trimmedAdress, uniname))));
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
}
}
