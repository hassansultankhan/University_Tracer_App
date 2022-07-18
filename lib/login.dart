import 'package:flutter/material.dart';
import 'package:universitylist_app/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({ Key? key }) : super(key: key);


  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  void initState() {
    logincheck();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login to University tracer'),
      centerTitle: true,
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            ElevatedButton(onPressed:()=> login(), child: Text('LOGIN'),),
          ],
        ),
      ),

    );
  }
    login()async{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('login', true);
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => homescreen(),), (route) => false);
    }


    void logincheck() async{
      final SharedPreferences pref = await SharedPreferences.getInstance();
      bool test = await pref.getBool('login') ?? false;
      if (test){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => homescreen(),), (route) => false);
      }
    }
  
}