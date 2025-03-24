
import 'package:get/route_manager.dart';
import 'package:prueba_tecnica_pokemon/pages/details/detail_pokemon_page.dart';
import 'package:prueba_tecnica_pokemon/pages/home/pokemon_list.dart';

class RoutesPages {
  static List<GetPage> routes = [

    // HOME - LISTA DE POKEMONES
    GetPage(name: '/home', page: () => const PokemonListPage()),

    // DETALLE DE POKEMON
    GetPage(name: '/detailPokemon', page: () => const DetailPokemonPage()),

  ];

}