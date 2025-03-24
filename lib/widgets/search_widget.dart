
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:prueba_tecnica_pokemon/controllers/pokemon_list_ctrl.dart';
import 'package:prueba_tecnica_pokemon/theme/colors_app.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GetBuilder<PokemonListCtrl>(
        builder: (gx) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: appBarHomeColor,
                    style: TextStyle(
                      color: titleColor
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: hintStyleColor
                      ),
                      icon: Icon(Icons.search, color: appBarHomeColor),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none
                    ),
                    onChanged: gx.searchPokemon
                  )
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.all(15),
                height: 50, width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/icons/icon_name.png"),
              )
            ]
          );
        }
      )
    );
  }

}