import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/data/storage/shared_prefs.dart';
import 'package:movies_app/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  SharedPrefsStorage storage = SharedPrefsStorage();
  await storage.init();

  runApp(MoviesApp(storage: storage));
}
