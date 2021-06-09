import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/provider.dart';

import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/pages/home_page.dart';
import 'package:flutter_app/src/pages/person_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SQLite CRUD',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'person': (context) => PersonPage(),
        },
        theme: ThemeData(
          primaryColor: AppColors.blueColor,
          primaryTextTheme: Theme.of(context)
              .primaryTextTheme
              .apply(bodyColor: AppColors.whiteColor),
          primaryIconTheme: Theme.of(context)
              .primaryIconTheme
              .copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
