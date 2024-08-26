import 'package:appfour/func/content.dart';
import 'package:appfour/func/game.dart';
import 'package:flutter/material.dart';

class Difficulty extends StatefulWidget {
  const Difficulty({super.key});
  static const String routeName = '/difficulty';

  @override
  State<Difficulty> createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/gif1.gif'), fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.monitor_heart_outlined),
                  label: const Text(
                    'Easy',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Game.difficulty = 'easy';
                      wordsFromMap = hangmanWordsGeneral.keys.toList();
                      hintsFromMap = hangmanWordsGeneral.values.toList();
                      Game.words = wordsFromMap;
                    });
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.black.withOpacity(0.5))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.monitor_heart_rounded),
                  label: const Text(
                    'Medium',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Game.difficulty = 'medium';
                      wordsFromMap = mediumHangmanWords.keys.toList();
                      hintsFromMap = mediumHangmanWords.values.toList();
                      Game.words = wordsFromMap;
                    });
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.black.withOpacity(0.5))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                width: (MediaQuery.sizeOf(context).width / 6) * 5,
                child: const Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Notice: ',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Joystix',
                            color: Color.fromARGB(255, 243, 25, 9)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Levels will change when you change difficulty',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Joystix',
                            color: Color.fromARGB(255, 228, 226, 225)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
