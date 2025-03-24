
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PokemonListCtrl extends GetxController {

  final ScrollController scrollControllerList = ScrollController();
  final List<String> pokemones = [];

  List<String> pokemonesView = [];

  bool loadingMorePokemon = false;
  int limitPerList = 20;
  int pagePokemonList = 0;
  int offsetPokemonList = 0;

  @override
  void onInit() {
    scrollControllerList.addListener(_scrollFinish);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getLista();
  }

  void _scrollFinish() async {
    double maxScroll = scrollControllerList.position.maxScrollExtent;
    double currentScroll = scrollControllerList.position.pixels;
    if (currentScroll > maxScroll-10 && !loadingMorePokemon) {
      print("Cargar más a la vista...");
      loadingMorePokemon = true;
      update(["body_pokemon_list"]);
      pagePokemonList++;
      offsetPokemonList = limitPerList*pagePokemonList;
      for (var i = 0; i < limitPerList; i++) {
        pokemonesView.add(pokemones[offsetPokemonList]);
      }
      loadingMorePokemon = false;
      update(["body_pokemon_list"]);
    }
  }

  Future<void> getLista() async {  
    pokemones.clear(); 
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0") 
    );
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      for (var item in data["results"]) {
        String name = item['name'].toString();
        String nombre = (name.substring(0,1).toUpperCase()) + name.substring(1, name.length) ;
        pokemones.add(nombre);
      }
      for (var i = 0; i < limitPerList; i++) {
        pokemonesView.add(pokemones[i]);
      }
      print("se cargo correctamente ${pokemones.length}");
      update(["body_pokemon_list"]);
    }else{
      print("hay error en la consulta");
    }
  }
  
  void searchPokemon(String txtSearch) {
    pokemonesView.clear();
    pagePokemonList = 0;
    offsetPokemonList = 0;
    if (txtSearch.isNotEmpty) {
      print("Buscar: $txtSearch");
      for (var pokemon in pokemones) {
        if (pokemon.contains(txtSearch)) {
          pokemonesView.add(pokemon);
        }
      }
    } else {
      print("Restaurar");
      for (var i = 0; i < limitPerList; i++) {
        pokemonesView.add(pokemones[i]);
      }
    }
    update(["body_pokemon_list"]);
  }

}