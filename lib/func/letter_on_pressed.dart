import 'package:appfour/UI/colors.dart';
import 'package:appfour/func/cachehelper.dart';
import 'package:appfour/func/game.dart';
import 'package:appfour/screens/options.dart';
import 'package:flutter/material.dart';

onPressedDoesNotContainLetter(BuildContext context) {
  if (Game.tries < Game.maxTries) {
    Game.tries++;
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black)),
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    fontFamily: 'Joystix',
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            icon: const Icon(Icons.heart_broken_rounded,
                size: 40, color: Colors.redAccent),
            content: const Text(
              textAlign: TextAlign.center,
              'Game Over',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Joystix',
              ),
            ),
          );
        });
    Game.restartLevel();
  }
}

onPressedDoesContainLetter(BuildContext context) {
  Game.correctLetters++;

  if (Game.correctLetters == Game.wordWithoutRepeat.length) {
    
    int test = Game.nextLevel();
    try {
      Game.difficulty == 'easy'?
      CacheHelper.setInt('level', Game.i!): CacheHelper.setInt('mlevel', Game.i!);
  }catch (e) {
      rethrow;
    }
    test == 1
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // elevation: 0,
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColor.myPrimaryColor)),
                    child: const Text('Next Level',
                        style: TextStyle(
                          fontFamily: 'Joystix',
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
                icon: Icon(
                  color: AppColor.mySeconderyColor.withAlpha(230),
                  Icons.face_retouching_natural,
                  size: 40,
                ),
                content: Text(
                    textAlign: TextAlign.center,
                    'Correct , its '
                    '${Game.words[Game.i! - 1].toUpperCase()} !',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Joystix',
                    )),
              );
            })
        : showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColor.myPrimaryColor)),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Joystix',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    },
                  )
                ],
                icon: const Icon(
                  color: Colors.green,
                  Icons.flag_circle_rounded,
                  size: 40,
                ),
                content: const Text(
                    textAlign: TextAlign.center,
                    'All Levels Solved',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Joystix',
                    )),
              );
            });
  }
}
