import 'package:appfour/func/content.dart';
import 'package:flutter/material.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});
  static const String routeName = '/levels';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gif1.gif'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
          child: ListView.builder(
              itemCount: wordsFromMap.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        titleTextStyle: const TextStyle(
                            fontSize: 20, fontFamily: 'Joystix'),
                        title: Text(
                          'Level: ${index + 1}',
                        ),
                        subtitleTextStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          backgroundColor: Colors.white70,
                          fontFamily: 'Joystix',
                          color: Colors.white,
                        ),
                        subtitle: Text(hintsFromMap[index]),
                        leading: const Icon(Icons.workspace_premium),
                        // tileColor: const Color.fromARGB(255, 77, 77, 77),
                        iconColor: const Color.fromARGB(255, 213, 213, 213),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 2,
                        height: 1,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
