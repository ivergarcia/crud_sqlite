import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/provider.dart';
import 'package:flutter_app/src/constants/colors.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  PersonBloc bloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bloc = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _fondo(),
            IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
              color: AppColors.whiteColor,
            ),
            Center(
              child: Container(
                width: size.width * 0.85,
                height: size.height * 0.75,
                margin: EdgeInsets.symmetric(vertical: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 5.0),
                          spreadRadius: 3.0)
                    ]),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Registrar Persona',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black38),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    _ingresarName(bloc),
                    _ingresarLastName(bloc),
                    _ingresarAddress(bloc),
                    _ingresarPhone(bloc),
                    SizedBox(
                      height: 20.0,
                    ),
                    _savePerson(bloc),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fondo() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _ingresarName(PersonBloc personBloc) {
    return StreamBuilder(
      stream: personBloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Nombre',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: personBloc.changeName,
          ),
        );
      },
    );
  }

  Widget _ingresarLastName(PersonBloc personBloc) {
    return StreamBuilder(
        stream: personBloc.lastNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Apellidos',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: personBloc.changeLastName,
            ),
          );
        });
  }

  Widget _ingresarAddress(PersonBloc personBloc) {
    return StreamBuilder(
        stream: personBloc.addressStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Dirección',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: personBloc.changeAddress,
            ),
          );
        });
  }

  Widget _ingresarPhone(PersonBloc personBloc) {
    return StreamBuilder(
        stream: personBloc.phoneStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.phone,     
              decoration: InputDecoration(
                  labelText: 'Teléfono',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: personBloc.changePhone,
            ),
          );
        });
  }

  Widget _savePerson(PersonBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton.icon(
            icon: Icon(Icons.save),
            label: Text('Guardar'),
            onPressed: snapshot.hasData ? () => _submit() : null,
            style: ElevatedButton.styleFrom(
                primary: AppColors.blueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 8.0));
      },
    );
  }

  void _submit() {
    bloc.agregarPersona();
    Navigator.pop(context);
  }

}
