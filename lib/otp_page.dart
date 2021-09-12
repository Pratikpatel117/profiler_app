import 'package:employ_newone/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
//import 'package:flutter_otp/flutter_otp.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

final TextEditingController _txt = TextEditingController();

bool _otpPass = false;
bool btnEnable = false;

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'OTP Authentication',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'An authentication code has been sent to ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TextField(
                  controller: _txt,
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    if (text.length == 6) {
                      setState(() {
                        btnEnable = true;
                      });
                    } else {
                      setState(() {
                        btnEnable = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter OTP Here',
                      errorText: _otpPass ? 'Enter Valid OTP' : null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 90),
                child: GestureDetector(
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: (_txt.text.length == 6
                              ? Color(0xFF52DAB9)
                              : Color(0xFF223B4F))),
                      child: Stack(
                        children: [
                          Container(
                            child: Text(
                              'SIGNIN',
                              style: TextStyle(color: Colors.white),
                            ),
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
                      if (_txt.text.length == 6) {
                        btnEnable = true;
                        Navigator.pushReplacementNamed(context, '/home');
                        // Navigator.pushNamed(
                        //   context,
                        //   '/home',
                        // );
                      } else {
                        btnEnable = false;
                      }
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Resend OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
