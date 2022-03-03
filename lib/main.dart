import 'package:flutter/material.dart';
import 'package:flutter_auto_machine/mainpage/main_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(const MainPage());
}
