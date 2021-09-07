import 'package:employ_newone/main.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _firsttxt = TextEditingController();
  final _lasttxt = TextEditingController();
  final _emailtxt = TextEditingController();
  final _phonetxt = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1985, 5),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String _genderSelect = "Male";
  final _gendeList = ["Male", "Female", "Other"];
  String _statusSelect = "Active";
  final _statusList = ["Active", "InActive"];
  String _codeSelect = "+1";
  final _codeList = ["+1", "+2", "+3", "+4", "+5", "+6", "+91"];

  late String value;

  @override
  void dispose() {
    // TODO: implement dispose
    _firsttxt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {
                  Navigator.pop(context),
                },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        titleSpacing: 10,
        title: Text(
          'Add Employee',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue[50],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                /*Stack(
                   //  alignment: Alignment.topCenter,
                   children: [
                      CircleAvatar(child: Icon(Icons.person,size: 100,),)
                  ],
                ),*/
                /*  SizedBox(
                  height: 130,
                ),*/
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Required";
                              } else
                                return null;
                            },
                            /* MultiValidator([
                             RequiredValidator(errorText: '* Required'),
                           ]),*/
                            controller: _firsttxt,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'Enter Last Name',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Last Name',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Required";
                              } else
                                return null;
                            },
                            controller: _lasttxt,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'Enter Last Name',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /*    Text(
                        'Gender',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextField(

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            hintStyle: TextStyle(fontSize: 15, color: Colors.black38),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),

                      ),
*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select gender',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      color: Colors.white),
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Select Gender',
                                      hintStyle: TextStyle(
                                          fontSize: 15, color: Colors.black38),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    items: _gendeList.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: new Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        this._genderSelect = value!;
                                      });
                                    },
                                    value: _genderSelect,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date of birth',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black38),
                                      ),
                                      IconButton(
                                          onPressed: () => _selectDate(context),
                                          icon: Icon(Icons.keyboard_arrow_down))
                                    ],
                                  ),
                                  /*      DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Select Gender',
                                      hintStyle: TextStyle(fontSize: 15, color: Colors.black38),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),

                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white)),),
                                    items: _gendeList.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: new Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? value ) {
                                      setState(() {
                                        this._genderSelect = value!;
                                      });
                                    },
                                    value:  _genderSelect ,
                                  )	,*/
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date of Join',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black38),
                                      ),
                                      IconButton(
                                          onPressed: () => _selectDate(context),
                                          icon: Icon(Icons.keyboard_arrow_down))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      color: Colors.white),
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Employee status',
                                      hintStyle: TextStyle(
                                          fontSize: 15, color: Colors.black38),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    items: _statusList.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: new Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        this._statusSelect = value!;
                                      });
                                    },
                                    value: _statusSelect,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            controller: _emailtxt,
                            validator: MultiValidator([
                              RequiredValidator(errorText: '* required'),
                              EmailValidator(
                                  errorText: 'please required email'),
                              //   LengthRangeValidator(min: 10, max: 10, errorText: 'please enter 10 number'),
                              //   RangeValidator(min: 13247, max: 4234, errorText: 'Enter Valid Employee code')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                items: _codeList.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: new Text(item),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    this._codeSelect = value!;
                                  });
                                },
                                value: _codeSelect,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: _phonetxt,
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: '* required'),
                                    // EmailValidator(errorText: 'please required email'),
                                    LengthRangeValidator(
                                        min: 10,
                                        max: 10,
                                        errorText: 'please enter 10 number'),
                                    RangeValidator(
                                        min: 13247,
                                        max: 4234,
                                        errorText: 'Enter Valid Employee code')
                                  ]),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white,
                                    hintText: 'Enter Phone Number',
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.black38),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Employee code',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: '* required'),
                              // EmailValidator(errorText: 'please required email'),
                              //  LengthRangeValidator(min: 10, max: 10, errorText: 'please enter 10 number'),
                              RangeValidator(
                                  min: 13247,
                                  max: 4234,
                                  errorText: 'Enter Valid Employee code')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'Enter Employee code',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Designation name',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: '* required'),
                              // EmailValidator(errorText: 'please required email'),
                              LengthRangeValidator(
                                  min: 13,
                                  max: 13,
                                  errorText: 'please enter 10 number'),
                              //        RangeValidator(min: 13247, max: 4234, errorText: 'Enter Valid Employee code')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'Enter designation code',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Department name',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: '* required'),
                              // EmailValidator(errorText: 'please required email'),
                              //         LengthRangeValidator(min: 10, max: 10, errorText: 'please enter 10 number'),
                              //     RangeValidator(min: 13247, max: 4234, errorText: 'Enter Valid Employee code')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              hintText: 'Enter department code',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 6,
                              child: Container(
                                height: 70,
                                alignment: Alignment.topCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Icon(Icons.cloud_upload),
                                    ),
                                    Text(
                                      'Upload passbook image',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Card(
                              elevation: 6,
                              child: Container(
                                height: 70,
                                alignment: Alignment.topCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Icon(Icons.cloud_upload),
                                    ),
                                    Text(
                                      'Upload adhar card image',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.teal),
                          child: MaterialButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                print('yesssss');
                              } else {
                                print('noooo');
                              }
                            },
                            elevation: 6,
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
