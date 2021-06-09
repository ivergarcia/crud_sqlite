import 'package:flutter/material.dart';
import 'package:flutter_app/src/components/edit_person.dart';
import 'package:flutter_app/src/components/list_person.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/editperson":
        return MaterialPageRoute(builder: (context) => EditPerson());
      default:
        var routeArray = settings.name.split('/');
        if (settings.name.contains('/editperson/')) {
          return MaterialPageRoute(
              builder: (context) => EditPerson(
                    id: int.parse(routeArray[2]),
                  ));
        }
        return MaterialPageRoute(builder: (context) => ListPerson());
    }
  }
}