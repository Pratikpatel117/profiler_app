import 'package:employ_newone/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//  import 'package:employ_newone/login_page/otp_page.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//   List<index> image = <index>[];
//String _stringValue;
class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
/*  late String _string;
  List<Map> _list = [
    {"id":'1',"image":"FlutterLogo","name":"America"},
    {"id":'2',"image":"FlutterLogo","name":"America"},
    {"id":'3',"image":"FlutterLogo","name":"America"},
    {"id":'4',"image":"FlutterLogo","name":"America"},
    {"id":'5',"image":"FlutterLogo","name":"America"},
  ];*/

  final _text = TextEditingController();

  bool btnEnable = false;

  // int number = 10;

  @override
  void dispose() {
    // TODO: implement dispose
    //  _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'SignIn',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Wellcome to Flutter World',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Enter mobile number',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*  DropdownButton<String>(
                  value: _stringValue,
                  items: <String>[
                    '+1', '+2', '+3', '+4', '+5', '+6', '+7',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child:  Text(value),
                    );
                  }).toList(),
                  hint: Text('Country Code'),
                  onChanged: (String) {
                    setState(() {
                      _stringValue = value;
                    });
                  },
                ),*/
                Flexible(
                  child: TextFormField(
                    //  key: _formKey,
                    controller: _text,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    // onSaved: (textchng) {
                    //   if (textchng?.length == 10) {
                    //     setState(() {
                    //       btnEnable = true;
                    //     });
                    //   } else {
                    //     btnEnable = false;
                    //   }
                    // },
                    onChanged: (textchng) {
                      if (textchng.length == 10) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          btnEnable = true;
                        });
                      } else {
                        setState(() {
                          btnEnable = false;
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    // style: TextStyle(),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.done,
                        color: (_text.text.length == 10
                            ? Color(0xFF52DAB9)
                            : Color(0xFF223B4F)),
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                      //      errorText: btnEnable ? 'Value Can not Be Empty' : null,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: GestureDetector(
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: (_text.text.length == 10
                          ? Color(0xFF52DAB9)
                          : Color(0xFF223B4F)),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: Text('SEND OTP',
                              style: TextStyle(color: Colors.white)),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    )),
                onTap: () {
                  setState(() {
                    if (_text.text.length == 10) {
                      btnEnable = true;
                      Navigator.pushNamed(
                        context,
                        '/otp',
                      );
                    } else {
                      btnEnable = false;
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}









/*
 final ScaffoldKey = GlobalKey<ScaffoldState>();
  final FormKey = GlobalKey<FormState>();
  String _email;
  String _password;

TextFormField(
key: FormKey,
decoration: InputDecoration(labelText: 'Enter Name'),
validator: (val) =>
if(value!.isEmpty || ! RegExp(r'[a-z A-Z]+$').hasMatch(value!)){
return "Enter Currect name";
}else {
return null;
}
),

TextFormField(
key: FormKey,
validator: (val) =>
val!.length != 10 ? 'Enter VAlid Password' : null,
onSaved: (val) => _password = val!,
)

*/



















