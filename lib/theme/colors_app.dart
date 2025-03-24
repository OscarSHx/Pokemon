
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_pokemon/utils/utils.dart';

final ThemeData myTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: appBarHomeColor
  ),
  scaffoldBackgroundColor: appBarHomeColor
);


final Color appBarHomeColor = hexToColor("#DC0A2D");

final Color hintStyleColor = hexToColor("#666666");

final Color fondoOpacityColor = hexToColor("#EFEFEF");

final Color titleColor = hexToColor("#1D1D1D");

final Color dividerColor = hexToColor("#E0E0E0");

// COLORES DE TIPO DE POKEMON
final Color grassColor =    hexToColor("#74CB48");
final Color fireColor =     hexToColor("#F57D31");
final Color waterColor =    hexToColor("#6493EB");
final Color bugColor =      hexToColor("#A7B723");
final Color electricColor = hexToColor("#F9CF30");
final Color ghostColor =    hexToColor("#70559B");
final Color normalColor =   hexToColor("#AAA67F");
final Color psychicColor =  hexToColor("#FB5584");
final Color steelColor =    hexToColor("#B7B9D0");
final Color poisonColor =   hexToColor("#A43E9E");
final Color flyingColor =   hexToColor("#A891EC");
final Color rockColor =     hexToColor("#B69E31");

final Map<String, Color> getColorTypePokemon = {
  "Grass": grassColor,
  "Fire": fireColor,
  "Water": waterColor,
  "Bug": bugColor,
  "Electric": electricColor,
  "Ghost": ghostColor,
  "Normal": normalColor,
  "Psychic": psychicColor,
  "Steel": steelColor,
  "Poison": poisonColor,
  "Flying": flyingColor,
  "Rock": rockColor,
};

