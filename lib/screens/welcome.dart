import 'package:appfour/func/cachehelper.dart';
import 'package:appfour/func/game.dart';
import 'package:appfour/screens/options.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  static const String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    TextEditingController tc = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.lightGreen,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover,
            image: AssetImage('assets/images/gif1.gif'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 160,
            ),
            Image.asset(
              'assets/images/icons8-hangman-64.png',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
              child: TextFormField(
                keyboardType: TextInputType.name,
                cursorColor: Colors.white,
                decoration: const InputDecoration(fillColor: Colors.white70,
                    border: OutlineInputBorder(gapPadding: 4),
                    focusedBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    prefixIconColor: Colors.black,
                    prefixIcon: Icon(Icons.account_box),
                    filled: true,
                    hintText: 'Your Name',
                    // hoverColor: Colors.amber,
                    focusColor: Colors.white,
                    alignLabelWithHint: true),
                style: const TextStyle(),
                autofocus: true,
                controller: tc,
                // initialValue: 'Your Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                if (tc.text.isEmpty) {
                  null;
                } else {
                  try {
                    CacheHelper.setString('name', tc.value.text);
                    Game.name = tc.text;
                  } catch (e) {
                    rethrow;
                  }
                  Navigator.pushReplacementNamed(context, Options.routeName);
                }
              },
              icon: const Icon(Icons.start),
              label: const Text('Start'),
              style: ButtonStyle(
                  backgroundColor:const MaterialStatePropertyAll(
                       Colors.white70),
                  textStyle: MaterialStateProperty.resolveWith(
                      (states) => const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.all(16)),
                  overlayColor: MaterialStateColor.resolveWith((states) =>
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.black87)
                  // foregroundColor:
                  //     MaterialStateColor.resolveWith((states) => Colors.white)),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
