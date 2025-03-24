
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica_pokemon/models/detail_pokemon_model.dart';
export 'package:prueba_tecnica_pokemon/models/detail_pokemon_model.dart';

class DetailPokemonCtrl extends GetxController {

  bool isLoadingData = true;
  int indexPokemon = 1;
  String descripPokemon = "";
  late final PokemonDetailModel pokemonDetailModel;

  @override
  void onInit() {
    indexPokemon = Get.arguments;
    indexPokemon++;
    super.onInit();
  }

  @override
  void onReady() {
    getDetailPokemon();
    getDescripcionPokemon();
    super.onReady();
  }

  void getDetailPokemon() async {    
    print("https://pokeapi.co/api/v2/pokemon/$indexPokemon");
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/$indexPokemon") 
    );
    if (response.statusCode == 200){
      pokemonDetailModel = pokemonDetailModelFromJson(response.body);
      print("Cargó");
    } else {
      print("Error");
      Get.back();
    }
    isLoadingData = false;
    update(["body_detail_pokemon"]);
  }

  void getDescripcionPokemon() async {    
    print("https://pokeapi.co/api/v2/pokemon-species/$indexPokemon");
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$indexPokemon")
    );
    if (response.statusCode == 200){
      descripPokemon = jsonDecode(response.body)["flavor_text_entries"].first["flavor_text"].toString().replaceAll("\n", "");
    } else {
      print("Error");
    }
    update(["descripcion_pookemon"]);
  }

  String getShortNameStats(String statName) {
    String shortNameStat = "---";
    switch (statName) {
      case "Hp":
        shortNameStat = "HP";
        break;
      case "Attack":
        shortNameStat = "ATK";
        break;
      case "Defense":
        shortNameStat = "DEF";
        break;
      case "Special-attack":
        shortNameStat = "SATK";
        break;
      case "Special-defense":
        shortNameStat = "SDEF";
        break;
      case "Speed":
        shortNameStat = "SPD";
        break;
      default:
    }
    return shortNameStat;
  }


}