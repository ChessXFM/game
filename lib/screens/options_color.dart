import 'package:appfour/UI/colors.dart';
import 'package:appfour/screens/options.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  static const String routeName = '/options color';

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.myPrimaryColor,
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
                  icon: const Icon(Icons.color_lens_sharp),
                  label: const Text(
                    'Brown',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AppColor.myPrimaryColor = Colors.brown;
                      AppColor.mySeconderyColor =
                          AppColor.myPrimaryColor.withOpacity(0.5);
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.brown)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.color_lens_sharp),
                  label: const Text(
                    'Orange',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AppColor.myPrimaryColor = Colors.deepOrangeAccent;
                      AppColor.mySeconderyColor =
                          AppColor.myPrimaryColor.withOpacity(0.5);
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepOrangeAccent)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.color_lens_sharp),
                  label: const Text(
                    'indigo',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AppColor.myPrimaryColor = Colors.indigo;
                      AppColor.mySeconderyColor =
                          AppColor.myPrimaryColor.withOpacity(0.5);
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.color_lens_sharp),
                  label: const Text(
                    'Red',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AppColor.myPrimaryColor = Colors.redAccent;
                      AppColor.mySeconderyColor =
                          AppColor.myPrimaryColor.withOpacity(0.5);
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.color_lens_sharp),
                  label: const Text(
                    'Teal',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Joystix',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      AppColor.myPrimaryColor = Colors.teal;
                      AppColor.mySeconderyColor =
                          AppColor.myPrimaryColor.withOpacity(0.5);
                      Navigator.pushReplacementNamed(
                          context, Options.routeName);
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                ),
              ),
              const SizedBox(
                height: 5,
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
