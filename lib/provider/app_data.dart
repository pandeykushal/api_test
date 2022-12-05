import 'dart:convert';

import 'package:apipractice/model/app_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class AppData extends ChangeNotifier{
  String testString = 'hello world';

Future fetchAlbum()  async {
  final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  print(response.statusCode.toString() + ' response code');
  var results =jsonDecode(response.body);
  // return results['userId'];
  return Album(userId: results['userId'], id: results['id'], title: results['title']);
  // a = results['userId'];
  // notifyListeners();
}

}