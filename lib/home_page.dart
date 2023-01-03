import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var reset = false;
  double ragnar = 130;
  double focalistic = 200;

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 1), () => setState(() => reset = true));

    Future.delayed(
        const Duration(seconds: 5),
        () => setState(() {
              ragnar = 180;
              focalistic = 140;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xff000000).withOpacity(0.8),
                    const Color(0xff1f1f1f).withOpacity(0.5),
                    const Color(0xff1f1f1f).withOpacity(0.4)
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                  stops: const [0.0, 0.5, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                    bottom: 0,
                    left: reset ? 90 : 250,
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.easeInOut,
                    child: Image.asset('assets/person.png',
                        height: MediaQuery.of(context).size.height / 1.5)),
                AnimatedPositioned(
                    top: reset ? ragnar : -70,
                    left: 40,
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.easeInOut,
                    child: const Text('RAGNAR',
                        style: TextStyle(
                            fontSize: 75,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold))),
                AnimatedPositioned(
                    top: reset ? focalistic : -70,
                    left: 40,
                    duration: const Duration(milliseconds: 1600),
                    curve: Curves.easeInOut,
                    child: const Text('Focalistic',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                const AnimatedPositioned(
                    top: 350,
                    left: 40,
                    duration: Duration(milliseconds: 1600),
                    curve: Curves.easeInOut,
                    child: Text('Jan. 7th 2023',
                        style: TextStyle(fontSize: 20, color: Colors.white)))
              ],
            ),
          ),
        ));
  }
}
