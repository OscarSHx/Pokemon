
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pokemon/controllers/pokemon_list_ctrl.dart';
import 'package:prueba_tecnica_pokemon/theme/colors_app.dart';
import 'package:prueba_tecnica_pokemon/utils/utils.dart';
import 'package:prueba_tecnica_pokemon/widgets/search_widget.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Image(image: AssetImage("assets/commons/pokeball.png"), height: 24.0),
            SizedBox(width: 16.0),
            Text(
              "Pókedex",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700
              )
            )
          ]
        )
      ),
      body: GetBuilder<PokemonListCtrl>(
        init: PokemonListCtrl(),
        builder: (context) => _cBodyPokemonList()
      )
    );
  }

  Widget _cBodyPokemonList() {
    return GetBuilder<PokemonListCtrl>(
      id: "body_pokemon_list",
      builder: (gx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchWidget(),
          SizedBox(height: 20),
          Expanded(
            child: SafeArea(
              bottom: true,
              child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Stack(
                  children: [
                    GridView.builder(
                      controller: gx.scrollControllerList,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8
                      ),
                      itemCount: gx.pokemonesView.length, 
                      itemBuilder: (BuildContext context, index){
                        int idPokemon = gx.pokemones.indexOf(gx.pokemonesView[index]);
                        return InkWell(
                          onTap: () {
                            print(gx.pokemonesView[index]);
                            print(gx.pokemones.indexOf(gx.pokemonesView[index]));
                            Get.toNamed("detailPokemon", arguments: idPokemon);
                          },
                          child: _cPokemonItem(idPokemon)
                        );
                      }
                    ),
                    if (gx.loadingMorePokemon) Positioned(
                      bottom: 10,
                      left: porcientoW(50)-24,
                      child: CircularProgressIndicator(color: appBarHomeColor)
                    )
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }

  Widget _cPokemonItem(int idPokemon) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8)
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: porcientoW(10),
              width: porcientoW(30),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(8)
              )
            )
          ),
          _cTxtNumber(idPokemon),
          Hero(
            tag: idPokemon,
            child: Center(
              child: FadeInImage.assetNetwork(
                width: porcientoW(20),
                image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${idPokemon+1}.png",
                placeholder: "assets/commons/pokeball_gray.png",
                placeholderCacheHeight: 30,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/commons/pokeball_gray.png", height: porcientoH(5));
                },
                placeholderErrorBuilder: (context, error, stackTrace) {
                  print("Error $error");
                  return Image.asset("assets/commons/pokeball_gray.png", height: porcientoH(5));
                },
              )
            )
          ),
          _cTxtName(idPokemon)
        ]
      ),
    );
  }

  Widget _cTxtNumber(int idPokemon) {
    return Positioned(
      top: 4, right: 8,
      child: Text(
        "#${idPokemon+1}",
        style: TextStyle(
          color: hintStyleColor,
          fontSize: 10
        ),
      ),
    );
  }

  Widget _cTxtName(int index) {
    return GetBuilder<PokemonListCtrl>(
      builder: (gx) {
        return Positioned(
          bottom: 0,
          child: Text(
            gx.pokemones[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: hintStyleColor
            )
          )
        );
      }
    );
  }

}