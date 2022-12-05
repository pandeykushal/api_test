import 'package:apipractice/model/app_data_model.dart';
import 'package:apipractice/provider/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int? userid ,id;
  String? title;
  bool isLoading = true;
  String myString = '';
  
  void getdata () async { 
    Album _album  
    
    = await AppData().fetchAlbum();
    setState(() {
      userid = _album.userId;
      id = _album.id;
      title = _album.title;
      isLoading = false;
    });
print(userid);  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myString = Provider.of<AppData>(context()).testString;
    // getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: isLoading == true ? const Center(child:  CircularProgressIndicator(),) : Column(
        children: [
          Text('this is a text'),
          Text(userid.toString()),
          // Text(Provider.of<AppData>(context).testString),
          Text(myString),
        ],
      ),
    );
  }
}