import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


void click(String? Uniname, BuildContext c) {
   
  AwesomeDialog(
    context: c,
    dialogType: DialogType.INFO,
    animType: AnimType.SCALE,
    dialogBackgroundColor: Colors.white70,
    title: '$Uniname',
    desc: '${Uniname} has been added to list',
    descTextStyle: TextStyle(fontSize: 15),
    btnOkOnPress: () {},
  ).show();
}