import 'package:appfour/UI/colors.dart';
import 'package:appfour/UI/widgets/custom_elevated_button.dart';
import 'package:appfour/func/cachehelper.dart';
import 'package:appfour/func/game.dart';
import 'package:appfour/screens/difficulty.dart';
import 'package:appfour/screens/options_color.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

bool isMusicOn = false;

class Options extends StatefulWidget {
  const Options({super.key});
  static const String routeName = '/options';

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  void initState() {
    super.initState();
    // CacheHelper.player.stop();
    CacheHelper.player.setSourceAsset('sounds/Hero.m4a');
    CacheHelper.player.setReleaseMode(ReleaseMode.loop);
    CacheHelper.player.play(AssetSource('sounds/Hero.m4a'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.myPrimaryColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gif1.gif'), fit: BoxFit.cover),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset('assets/images/icons8-hangman-64.png',
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          child: Stack(
                            children: [
                              Image.asset('assets/images/hang.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/1.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/head.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/la.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/ll.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/ra.png',
                                  height: 200, width: 200),
                              Image.asset('assets/images/rl.png',
                                  height: 200, width: 200),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                        customElevatedButtonForOptions(
                            context,
                            '/home',
                            'Play',
                            60,
                            200,
                            12,
                            30,
                            'Joystix',
                            Colors.black,
                            0.3, () async {
                          // CacheHelper.player.setSourceAsset('sounds/Hero.m4a');
                          await CacheHelper.player.stop();
                          await CacheHelper.player
                              .setSourceAsset('sounds/Rain.mp3');
                          await CacheHelper.player
                              .play(AssetSource('sounds/Rain.mp3'));
                          if (Game.difficulty == 'easy') {
                            try {
                              // ignore: await_only_futures
                              Game.i = await CacheHelper.getInt('level');
                              Game.i == null ? Game.i = 0 : null;
                            } catch (e) {
                              rethrow;
                            }
                          } else {
                            try {
                              // ignore: await_only_futures
                              Game.i = await CacheHelper.getInt('mlevel');
                              Game.i == null ? Game.i = 0 : null;
                            } catch (e) {
                              rethrow;
                            }
                          }
                        }),
                        // const SizedBox(height: 2),
                        // customElevatedButtonForOptions(context, '/home', 'New Game',
                        //     60, 200, 12, 30, 'Joystix', Colors.black, 0, () {}),
                        const SizedBox(height: 2),
                        customElevatedButtonForOptions(
                            context,
                            '/levels',
                            'Levels',
                            60,
                            200,
                            12,
                            30,
                            'Joystix',
                            Colors.black,
                            0.3,
                            () {}),
                        const SizedBox(height: 2),
                        customElevatedButtonForOptions(
                            context,
                            Difficulty.routeName,
                            'Difficulty',
                            60,
                            200,
                            12,
                            25,
                            'Joystix',
                            Colors.black,
                            0.3,
                            () {}),
                        const SizedBox(height: 2),
                        customElevatedButtonForOptions(
                            context,
                            ChangeTheme.routeName,
                            'Themes',
                            60,
                            200,
                            12,
                            30,
                            'Joystix',
                            Colors.black,
                            0.3,
                            () {}),
                        const SizedBox(height: 2),
                        isMusicOn
                            ? customElevatedButtonForMusic(
                                'Music Off',
                                60,
                                200,
                                12,
                                26,
                                'Joystix',
                                const Color.fromARGB(255, 233, 34, 34),
                                0.5, () async {
                                await CacheHelper.player
                                    .setSourceAsset('sounds/Hero.m4a');
                                await CacheHelper.player
                                    .setReleaseMode(ReleaseMode.loop);
                                CacheHelper.player
                                    .play(AssetSource('sounds/Hero.m4a'));
                                setState(() {
                                  isMusicOn = !isMusicOn;
                                });
                              })
                            : customElevatedButtonForMusic(
                                'Music On',
                                60,
                                200,
                                12,
                                26,
                                'Joystix',
                                const Color.fromARGB(255, 32, 172, 32),
                                0.5, () async {
                                CacheHelper.player.pause();
                                setState(() {
                                  isMusicOn = !isMusicOn;
                                });
                              }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
