import 'package:employ_newone/api_call/emp_add_data.dart';
import 'package:employ_newone/model/employ_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmployList extends StatefulWidget {
  const EmployList({Key? key}) : super(key: key);

  @override
  _EmployListState createState() => _EmployListState();
}

class _EmployListState extends State<EmployList> {
  // EmployList employList = EmployList();
  final dialogTital = TextEditingController();

  /* int? id;
  String? title;
  String? url;
  String? thumbnailUrl;*/

  /*void subData(){
  dialogTital.clear();
}*/

  String? title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* addData.getData().then((value) =>
        model = value
   );
*/
  }

  AddData addData = AddData();

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
          'Employee List',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (con) => AlertDialog(
                        title: Text('Enter Employ Data'),
                        content: TextField(
                          decoration: InputDecoration(hintText: 'Add Title'),
                          /* onChanged: (_var){
                          title = _var;
                        },*/
                          controller: dialogTital,
                        ),
                        actions: [
                          ElevatedButton(
                              child: Text('Add'),
                              onPressed: () {
                                createTitle() async {
                                  print(title);

                                  Map<String, dynamic> info = {
                                    "title": title,
                                  };

                                  String responce =
                                      await addData.createTitle(info);
                                  responce == "Data"
                                      ? Fluttertoast.showToast(
                                          msg: 'Data Succesfully Added')
                                      : Fluttertoast.showToast(
                                          msg: 'Data Not Added');
                                  Navigator.of(context).pop();
                                  setState(() {});
                                  //    subData();
                                }
                              })
                        ],
                      ));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
          color: Colors.lightBlue[50],
          child: Column(
            children: [
              Flexible(
                child: FutureBuilder<List<EmployModel>>(
                    future: addData.getData(),
                    builder: (context, snapshort) {
                      if (snapshort.hasData) {
                        //   List<EmployModel>
                        var result = snapshort.data!;

                        return ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (BuildContext context, index) {
                              var data = result[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.white,
                                  child: ListTile(
                                    selected: true,
                                    onTap: () {},
                                    tileColor: Colors.green,
                                    title: Text(data.title),
                                    leading: Image.network(data.thumbnailUrl),
                                    trailing: Icon(Icons.delete),
                                  ),
                                ),
                              );
                            });
                      } else if (snapshort.hasError) {
                        return Text('Some Error');
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamed(context, '/addemploy');
        },
        child: Icon(Icons.person_add_alt),
      ),
    );
  }
}

/*    leading: Image(
                                        image: AssetImage(
                                            'asset/image/profile.png'),
                                        height: 65,
                                        width: 65,
                                      ),
                                      title: Text(
                                        'John Deo $index',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Manager',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black45),
                                      ),
                                      trailing: Icon(
                                          Icons.arrow_forward_ios_outlined),  */  // list icon

/*class SearchItem extends SearchDelegate<String> {



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {})
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}*/

/*     Row(
            mainAxisSize: MainAxisSize.max,
             // mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image(image: AssetImage('asset/image/profile.png',),height: 65,width: 65,),                                //     CircleAvatar(child: Image(image: AssetImage('asset/image/profile.png'),height: 65,width: 65,),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                      Row(children: [Text('John Deo',style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.bold),)],),
                        SizedBox(height: 3,),
                       Row(children: [Text('Manager',style: TextStyle(fontSize: 10,color: Colors.black45),)],)
                       ],

               ),

              Icon(Icons.arrow_forward_ios_outlined)
             ],
           ),
             ],
           ),*/
