//import 'package:employ_newone/pubdev_pin.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
//import 'package:employ_newone/pin_code_field_demo.dart';
//import 'login_page.dart';

import 'package:employ_newone/add_employee.dart';
import 'package:employ_newone/employ_list.dart';
import 'package:flutter/material.dart';
import 'package:employ_newone/login_page.dart';
import 'home_page.dart';
import 'otp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/otp': (context) => OtpPage(),
        '/home': (context) => HomePage(),
        '/employlist': (context) => EmployList(),
        '/addemploy': (context) => AddEmployee(),
      },
    );
  }
}
