
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//==========================================================
/// DEVUELVE PORCIENTO DE ANCHO DE LA PANTALLA
//==========================================================
double porcientoW(double valor ){
  final size = MediaQuery.of(Get.context!).size;
  return ((size.width/100) * valor);
}

//==========================================================
/// DEVUELVE PORCIENTO DE ALTO DE LA PANTALLA
//==========================================================
double porcientoH(double valor ){
  final size = MediaQuery.of(Get.context!).size;
  return ((size.height/100) * valor);
}

//==========================================================
/// DEVUELVE COLOR EN HEXADECIMAL
//==========================================================
Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

