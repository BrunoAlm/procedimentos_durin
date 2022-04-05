import 'package:flutter/material.dart';

class Validators {
  Validators._();

  static FormFieldValidator contemEspaco(String message) {
    return (value) {
      String valorEmString = value.toString();
      if (valorEmString.contains(" ")) {
        return message;
      }

      return null;
    };
  }
}
