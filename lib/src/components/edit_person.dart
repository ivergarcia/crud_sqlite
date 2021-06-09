import 'package:flutter/material.dart';
import 'package:flutter_app/src/components/widget/button.dart';
import 'package:flutter_app/src/constants/colors.dart';

class EditPerson extends StatefulWidget {
  final int id;
  EditPerson({Key key, this.id}) : super(key: key);

  @override
  _EditPersonState createState() => _EditPersonState();
}

class _EditPersonState extends State<EditPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.id != null
         ? Text('Edit Person')
         : Text('Create Person'),
         centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(decoration: InputDecoration(labelText: 'Name'),),
                    TextFormField(decoration: InputDecoration(labelText: 'Last Name'),),
                    TextFormField(decoration: InputDecoration(labelText: 'Description'), maxLines: 2,),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Button(title: 'Guardar', onPressed: () => Navigator.pop(context), color: AppColors.orangeColor,),)
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}