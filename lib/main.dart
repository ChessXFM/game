import 'package:appfour/UI/colors.dart';
import 'package:appfour/func/cachehelper.dart';
import 'package:appfour/func/game.dart';
import 'package:appfour/screens/difficulty.dart';
import 'package:appfour/screens/home.dart';
import 'package:appfour/screens/levels.dart';
import 'package:appfour/screens/options.dart';
import 'package:appfour/screens/options_color.dart';
import 'package:appfour/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Game.name = CacheHelper.getString('name'); //! await if nessesary ..
  // Game.words.shuffle();
  Game.i = CacheHelper.getInt('level');
  Game.i == null ? Game.i = 0 : null;
  Game.word = Game.words[Game.i!].toUpperCase();
  Game.maxTries = 7;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // double rh = MediaQuery.of(context).size.height;
    // double rw = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      initialRoute: Game.name == null ? '/welcome' : '/options',
      routes: {
        Welcome.routeName: (context) => const Welcome(),
        Home.routeName: (context) => const Home(),
        Options.routeName: (context) => const Options(),
        ChangeTheme.routeName: (context) => const ChangeTheme(),
        Levels.routeName: (context) => const Levels(),
        Difficulty.routeName: (context) => const Difficulty(),
      },
      //!darkTheme: ThemeData.dark(useMaterial3: true),
      // home: const Welcome(),
    );
  }
}
