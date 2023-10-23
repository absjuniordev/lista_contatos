import 'package:flutter/material.dart';

class CustomColor {
  final Color _primeiroContainer = const Color.fromARGB(255, 34, 78, 134);
  final Color _segundoContainer = const Color.fromARGB(225, 255, 255, 255);

  Color getPrimeiroContainer() {
    return _primeiroContainer;
  }

  Color getSegundoContainer() {
    return _segundoContainer;
  }
}
