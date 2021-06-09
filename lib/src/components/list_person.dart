import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
class ListPerson extends StatefulWidget {
  final String title;

  ListPerson({Key key, this.title}) : super(key: key);
  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: AppColors.whiteColor),),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            color: AppColors.whiteColor, 
            iconSize: 30.0, 
            onPressed: ()=> Navigator.pushNamed(context, '/editperson'))
        ],
      ),
    );
  }
}