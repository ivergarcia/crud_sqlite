// import 'package:flutter/material.dart';

// import 'package:flutter_app/src/bloc/person_bloc.dart';
// export 'package:flutter_app/src/bloc/person_bloc.dart';


// class Provider extends InheritedWidget {

//   final personBloc = new PersonBloc();

//   static Provider _instancia;

//   factory Provider({ Key key, Widget child }) {

//     if ( _instancia == null ) {
//       _instancia = new Provider._internal(key: key, child: child );
//     }

//     return _instancia;

//   }

//   Provider._internal({ Key key, Widget child })
//     : super(key: key, child: child );


//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => true;

//   static PersonBloc of ( BuildContext context ) {
//     //return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).personBloc;
//     return ( context.dependOnInheritedWidgetOfExactType<Provider>()).personBloc;
//   }

// }
import 'package:flutter/material.dart';

import 'package:flutter_app/src/bloc/person_bloc.dart';
export 'package:flutter_app/src/bloc/person_bloc.dart';

class Provider extends InheritedWidget{
  final PersonBloc bloc;

  Provider({Key key, Widget child})
    :bloc = PersonBloc(),
    super(key:key,child:child);

    bool updateShouldNotify(_) => true;

    static PersonBloc of (BuildContext context){
      return ( context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
    }
}