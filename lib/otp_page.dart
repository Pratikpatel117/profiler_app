import 'package:employ_newone/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
//import 'package:flutter_otp/flutter_otp.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

final  TextEditingController _txt = TextEditingController();

 bool _otpPass = false ;

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
          ),onTap: (){
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
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                     hintText: 'Enter OTP Here',
                     errorText: _otpPass ? 'Enter Valid OTP' : null ),

               ),
               ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 90),
                child: GestureDetector(
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.lightBlueAccent),
                      child: Stack(
                        children: [
                          Container(
                            child: Text('SIGNIN',style: TextStyle(color: Colors.white),),
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            child: Container(
                              child: Icon(Icons.arrow_right_alt_sharp,color: Colors.white,),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      )),
                  onTap: () {
                    setState(() {
                          if(_txt.text.isEmpty){
                            _otpPass = _txt.text.isEmpty || _txt.text.isNotEmpty != 1111 ? true : false ;
                          }else {
                            Navigator.pushNamed(
                              context,
                              '/home',
                            );
                          }
                    });
                  },
                ),
              ),
              TextButton(onPressed: (){}, child: Text('Resend OTP'),)
            
            ],
          ),
        ),
      ),
    );
  }
}



