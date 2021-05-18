import 'package:blogapplication/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedantic/pedantic.dart';
import 'package:blogapplication/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  unawaited(getIt.init());
  runApp(MyApp());
}

