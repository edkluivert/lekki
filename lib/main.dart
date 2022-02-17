import 'package:flutter/material.dart';
import 'package:lekki/di/app_bindings.dart';

import 'lekki.dart';

void main() {
  AppBindings().dependencies();
  runApp(const Lekki());
}




