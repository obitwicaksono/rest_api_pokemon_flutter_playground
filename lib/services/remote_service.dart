import 'package:rest_api_pokemon_flutter_playground/models/pokemon_list.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Result>?> getPokemon() async {
    var client = http.Client();

    var uri = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=20',
    );
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final pokemonData = pokemonFromJson(response.body);
      List<Result> listHasil =
          pokemonData.results; // arti kode ini apa ?
      return listHasil;
    }
  }
}
