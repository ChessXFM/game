import 'package:appfour/func/content.dart';

class Game {
  static int tries = 0;
  static int maxTries = 0;
  static String difficulty = 'easy';
  static List<String> selectedLetter = [];
  static String? name;

  static int? i = 0;
  static String word = 'flutter'.toUpperCase();
  static Set wordWithoutRepeat = Game.word.split('').toSet();
  static int correctLetters = 0;
  static List<String> words = wordsFromMap;
  static List<String> hints = hintsFromMap;
  static restartLevel() {
    tries = 0;
    selectedLetter = [];
    correctLetters = 0;
  }

  static restartOver() {
    tries = 0;
    selectedLetter = [];
    correctLetters = 0;
    Game.word = Game.words[0].toUpperCase();
    // maxTries = Game.words[0].length;
    wordWithoutRepeat = Game.word.split('').toSet();
    i = 0;
  }

  static nextLevel() {
    tries = 0;
    selectedLetter = [];
    correctLetters = 0;

    if (i! + 1 < Game.words.length) {
      i = i! + 1;
      Game.word = Game.words[i!].toUpperCase();
      // maxTries = Game.words[i].length;
      wordWithoutRepeat = Game.word.split('').toSet();
      return 1;
    } else {
      return 2;
    }
  }
}
