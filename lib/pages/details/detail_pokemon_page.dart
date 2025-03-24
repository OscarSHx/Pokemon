
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prueba_tecnica_pokemon/controllers/detail_pokemon_ctrl.dart';
import 'package:prueba_tecnica_pokemon/theme/colors_app.dart';
import 'package:prueba_tecnica_pokemon/utils/utils.dart';

class DetailPokemonPage extends StatelessWidget {
  const DetailPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPokemonCtrl>(
      id: "body_detail_pokemon",
      init: DetailPokemonCtrl(),
      builder: (gx) {
        return GetBuilder<DetailPokemonCtrl>(
          builder: (gx) => (!gx.isLoadingData)
          ? Scaffold(
            backgroundColor: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name],
            body: Stack(
              alignment: Alignment.center,
              children: [
                _gImagePokeBall(),
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    gx.pokemonDetailModel.forms.first.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  centerTitle: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text("#${gx.pokemonDetailModel.id}"),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: SafeArea(
                    bottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      height: porcientoH(62),
                      width: porcientoW(100)-16,
                    ),
                  ),
                ),
                _cImagePokemon(gx.indexPokemon, gx.pokemonDetailModel.sprites.other!.officialArtwork.frontDefault),
                Positioned(
                  bottom: 0,
                  child: SafeArea(
                    bottom: true,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: porcientoH(53),
                      width: porcientoW(100)-16,
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: gx.pokemonDetailModel.types.map((e) => _cTypesPokemon(e.type.name)).toList()
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "About",
                              style: TextStyle(
                                color: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name] ?? appBarHomeColor,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 16),
                            _cContAbout(),
                            SizedBox(height: 16),
                            _cDescripcionPokemon(),
                            SizedBox(height: 16),
                            _cBaseStats()
                          ]
                        ),
                      )
                    )
                  )
                )
              ]
            )
          )
          : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(color: appBarHomeColor)
            )
          )
        );
      }
    );
  }

  Widget _gImagePokeBall() {
    return Positioned(
      top: 10, right: 10,
      child: SafeArea(
        top: true,
        child: Image.asset(
          "assets/commons/pokeball_gray.png",
          height: porcientoH(25), 
          opacity: const AlwaysStoppedAnimation(.3)
        ),
      )
    );
  }

  Widget _cImagePokemon(int index, String image) {
    return Positioned(
      top: porcientoH(15),
      child: Hero(
        tag: index-1,
        child: FadeInImage.assetNetwork(
          height: porcientoH(30),
          image: image,
          placeholder: "assets/commons/pokeball_gray.png",
          placeholderCacheHeight: 30,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/commons/pokeball_gray.png", height: porcientoH(5));
          }
        )
      )
    );
  }

  Widget _cTypesPokemon(String type) {
    return Container(
      decoration: BoxDecoration(
        color: getColorTypePokemon[type] ?? appBarHomeColor,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w700
        )
      )
    );
  }

  Widget _cContAbout() {
    return GetBuilder<DetailPokemonCtrl>(
      builder: (gx) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      
          Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/commons/peso.png", height: 15),
                  SizedBox(width: 10),
                  Text(
                    "${gx.pokemonDetailModel.weight} kg",
                    style: TextStyle(
                      fontSize: 12,
                      color: titleColor
                    )
                  )
                ]
              ),
              Text(
                "Weight",
                style: TextStyle(
                  fontSize: 10,
                  color: hintStyleColor
                )
              )
            ]
          ),
          
          VerticalDivider(color: dividerColor, width: 2, indent: 0,),
      
          Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/commons/altura.png", height: 15),
                  SizedBox(width: 10),
                  Text(
                    "${gx.pokemonDetailModel.height} m",
                    style: TextStyle(
                      fontSize: 12,
                      color: titleColor
                    )
                  )
                ]
              ),
              Text(
                "Height",
                style: TextStyle(
                  fontSize: 10,
                  color: hintStyleColor
                )
              )
            ]
          ),
      
          VerticalDivider(color: dividerColor),
      
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: gx.pokemonDetailModel.abilities.map((e) => Text(
                e.ability.name,
                style: TextStyle(
                  fontSize: 12,
                  color: titleColor
                ))).toList()
              ),
              Text(
                "Moves",
                style: TextStyle(
                  fontSize: 10,
                  color: hintStyleColor
                )
              )
            ]
          )
        ]
      )
    );
  }

  Widget _cDescripcionPokemon() {
    return GetBuilder<DetailPokemonCtrl>(
      id: "descripcion_pookemon",
      builder: (gx) => Text(
        gx.descripPokemon,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 14,
          color: titleColor,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }

  Widget _cBaseStats() {
    return GetBuilder<DetailPokemonCtrl>(
      builder: (gx) {
        return Column(
          children: [
            Text(
              "Base Stats",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name] ?? appBarHomeColor
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: gx.pokemonDetailModel.stats.map((e) => _cTxtStats(e.stat.name)).toList()
                  ),
                  VerticalDivider(color: dividerColor, width: 24),
                  Column(
                    children: gx.pokemonDetailModel.stats.map((e) => _cTxtNumStats(e.baseStat)).toList()
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 14,
                      children: gx.pokemonDetailModel.stats.map((e) => _cBarStat(e)).toList()
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    ); 
  }

  Widget _cTxtStats(String stat) {
    return GetBuilder<DetailPokemonCtrl>(
      builder: (gx) {
        return Text(
          gx.getShortNameStats(stat),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name]
          )
        );
      }
    );
  
  }

  Widget _cTxtNumStats(int stat) {
    return Text(
      "$stat",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: titleColor
      )
    );
  }

  Widget _cBarStat(Stat stat) {
    return GetBuilder<DetailPokemonCtrl>(
      builder: (gx) {
        return LinearPercentIndicator(
          barRadius: Radius.circular(4),
          animation: true,
          lineHeight: 6,
          percent: stat.baseStat/255,
          backgroundColor: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name]?.withValues(alpha: 0.3) ?? appBarHomeColor.withValues(alpha: 0.3),
          progressColor: getColorTypePokemon[gx.pokemonDetailModel.types.first.type.name] ?? appBarHomeColor
        );
      }
    );
  }

}