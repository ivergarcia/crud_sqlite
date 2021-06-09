import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/provider.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/models/person.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD'),
        centerTitle: true,
      ),
      body: _listarPersonas(bloc),
      floatingActionButton: _crearPerson(context),
    );
  }

  Widget _crearPerson(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.blueColor,
        onPressed: () => Navigator.pushNamed(context, 'person'));
  }

  Widget _listarPersonas(PersonBloc bloc) {
    return StreamBuilder<List<Person>>(
      stream: bloc.personasStream,
      builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
        if (snapshot.hasData) {
          final personas = snapshot.data;
          return ListView.builder(
              itemCount: personas.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, bloc, personas[i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, PersonBloc bloc, Person person) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: AppColors.blueColor,
        ),
        onDismissed: (direccion) => bloc.borrarPersona(person.id),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text('${person.name} - ${person.lastName}'),
                  subtitle: Text(person.address),
                  onTap: () => {}),
            ],
          ),
        ));
  }
}
