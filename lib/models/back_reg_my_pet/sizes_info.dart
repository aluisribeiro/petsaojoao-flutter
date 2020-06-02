import 'package:flutter/material.dart';

class CalculateSize {
  by(context, valor) {
    return MediaQuery
        .of(context)
        .size
        .height / valor;
  }
}
