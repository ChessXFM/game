import 'package:appfour/UI/widgets/hang_image.dart';
import 'package:appfour/UI/widgets/letter.dart';
import 'package:appfour/func/cachehelper.dart';
import 'package:appfour/func/content.dart';
import 'package:appfour/func/game.dart';
import 'package:appfour/UI/colors.dart';
import 'package:appfour/func/letter_on_pressed.dart';
import 'package:appfour/screens/options.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> ll = letterList(context);
    return Scaffold(
      //backgroundColor: AppColor.myPrimaryColor.withOpacity(0.5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/gif2.gif'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Text(
                          'Name: ${Game.name}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Joystix'),
                        ),
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Text(
                          'Tries: ${Game.tries}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Joystix'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(children: [
                const SizedBox(
                  height: 150,
                ),
                Center(
                  // heightFactor: 200,widthFactor: ,
                  child: Stack(
                    children: [
                      hangimage(Game.tries > 0, 'assets/images/hang.png'),
                      hangimage(Game.tries > 1, 'assets/images/1.png'),
                      hangimage(Game.tries > 2, 'assets/images/head.png'),
                      hangimage(Game.tries > 3, 'assets/images/la.png'),
                      hangimage(Game.tries > 4, 'assets/images/ll.png'),
                      hangimage(Game.tries > 5, 'assets/images/ra.png'),
                      hangimage(Game.tries > 6, 'assets/images/rl.png'),
                    ],
                  ),
                ),
              ]),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ll,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  child: Text(
                    hintsFromMap[Game.i!],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Joystix'),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black12,
                  ),
                  // color: Colors.white60,
                  width: double.infinity,
                  height: 212,
                  child: GridView.count(
                    crossAxisCount: 7,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    // padding: const EdgeInsets.all(2),
                    children: alphabets.map((e) {
                      return RawMaterialButton(
                        onPressed: Game.selectedLetter.contains(e)
                            ? null
                            : () {
                                setState(() {
                                  Game.selectedLetter.add(e);
                                  if (!Game.word
                                      .split('')
                                      .contains(e.toUpperCase())) {
                                    onPressedDoesNotContainLetter(context);
                                  } else {
                                    onPressedDoesContainLetter(context);
                                  }
                                });
                              },
                        fillColor: Game.selectedLetter.contains(e)
                            ? Colors.black87
                            : AppColor.mySeconderyColor.withAlpha(200),
                        // shape: const StarBorder.polygon(sides: 4),
                        // shape: const OvalBorder(eccentricity: 0.5),
                        child: Text(
                          e,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pixel'),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              //
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.myPrimaryColor),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Options.routeName);
                  CacheHelper.player.stop();
                },
                icon: const Icon(Icons.arrow_back_sharp),
                label: const Text(
                  'Back to main menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pixel',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
