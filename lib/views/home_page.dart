import 'package:flutter/material.dart';
import 'package:rest_api_pokemon_flutter_playground/models/pokemon_list.dart';
import 'package:rest_api_pokemon_flutter_playground/services/remote_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Result>? pokemon;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    pokemon = await RemoteService().getPokemon();
    if (pokemon != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon API'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: pokemon?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pokemon![index].name),
            subtitle: Text(pokemon![index].url),
          );
        },
      ),
    );
  }
}
