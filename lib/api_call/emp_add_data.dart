import 'dart:convert';
import 'package:employ_newone/model/employ_model.dart';
import 'package:http/http.dart' as http;

class AddData {
  var Url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<EmployModel>> getData() async {
    try {
      final responce = await http.get(Uri.parse(Url));
      if (responce.statusCode == 200) {
        final employModel = jsonDecode(responce.body);

        return employModel
            .map<EmployModel>((json) => EmployModel.fromJson(json))
            .toList();
      } else {
        return <EmployModel>[]; // server error
      }
    } catch (exception) {
      return <EmployModel>[]; // network error

    }
  }

  Future<String> createTitle(Map<String, dynamic> info) async {
    try {
      var responce = await http.post(Uri.parse("$Url/create"), //"$Url/create"
          body: jsonEncode(info),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
          });
      if (responce.statusCode == 200) {
        print(responce.body);
        //   return jsonDecode(responce.body);
        return "Data";
      } else {
        print('Server Error');
        return 'Server Error'; // server error
      }
    } catch (SocketException) {
      return 'Fetching Error'; // network error

    }
  }

//   Future<http.Response> updateAlbum(String title) async{
// final http.Response response = await http.put(Uri.parse(Url),
// //	'https://jsonplaceholder.typicode.com/albums/1',
// 	headers: <String, String> {
// 	'Content-Type': 'application/json; charset=UTF-8',
// 	},
// 	body: jsonEncode(<String, String>{
// 	'title': title,
//   	}
//   ),
// );
// if (response.statusCode == 200) {
//    return
// }

}

//   List<EmployModel> displyData = data.map((info) => EmployModel.fromJson(info)).toList();
