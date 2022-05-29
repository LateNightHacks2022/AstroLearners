import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'navigation_drawer.dart'; // new
import './authentication.dart';
import './firebase_options.dart';

import 'package:late_nighthacks/login_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Late Night Hacks 2022',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MissionLog(
          title:
              "Chloe Misison Log"), //MyHomePage(title: 'Weh Night Hacks 2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, User? user})
      : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
            const SizedBox(width: 20),
            Image.asset(
              '../assets/images/rocket.png',
              fit: BoxFit.contain,
              height: 75,
            ),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '<We gonna list their personal stats/info or num of ships here or some shit>',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, User? user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[buildHeader(context), buildMenuItems(context)],
        )),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 5),
        // TODO: Put user's data
        child: Column(children: const [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                "https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=1600&h=900"),
          ),
          SizedBox(height: 12),
          Text('Username', style: TextStyle(fontSize: 28)),
          Text('username@gmail.com', style: TextStyle(fontSize: 15))
        ]),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 15,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                debugPrint("Clicked Home");
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                      title: 'AstroLearners',
                    ),
                  ),
                );
              },
            ),
            // TODO: Add a function/widget that will loop through existing task lists and display here
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text("Physics Planet"),
              onTap: () {
                debugPrint("Clicked Physics Ship");
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StudyPlanet("Physics Planet")),
                );
              },
            ),
            Center(child: GoogleSignInButton()),
          ],
        ),
      );
}

class StudyPlanet extends StatelessWidget {
  const StudyPlanet(this.shipTitle, {Key? key}) : super(key: key);

  final String shipTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shipTitle),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/nightBg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0,
            alignment: WrapAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: 300,
                height: 240,
                // color: const Color.fromARGB(164, 0, 251, 255),
                child: InkWell(
                  onTap: () {
                    // print("Click event on Container");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MissionLog(
                          title: 'Chloe Misison log',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        top: 125,
                        left: 10,
                        child: Container(
                          width: 260,
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(187, 177, 177, 177),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Name: Chloe",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Items remaining: 3",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Mission status: In progress",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 15,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Color.fromARGB(255, 66, 120, 140),
                          ),
                          child: Image.asset(
                            'images/astrored.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: 300,
                height: 240,
                // color: const Color.fromARGB(164, 0, 251, 255),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 125,
                      left: 10,
                      child: Container(
                        width: 260,
                        height: 100,
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(187, 177, 177, 177),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Name: Sam",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Items remaining: 3",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mission status: In progress",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 15,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Color.fromARGB(255, 66, 120, 140),
                        ),
                        child: Image.asset(
                          'images/astrored.png',
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class MissionLog extends StatefulWidget {
  const MissionLog({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MissionLog> createState() => _MissionLogState();
}

class _MissionLogState extends State<MissionLog> {
  // final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
            const SizedBox(width: 20),
            Image.asset(
              '../assets/images/rocket.png',
              fit: BoxFit.contain,
              height: 75,
            ),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: gradient1Stops,
            colors: gradient1Colors,
          ),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(207, 0, 0, 0),
            ),
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.topLeft,
                  // margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      'svg/topLeftCorner.svg',
                      color: Color.fromARGB(255, 0, 255, 247),
                      semanticsLabel: 'topLeftCorner',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomRight,
                  // margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      'svg/bottomRightCorner.svg',
                      color: const Color.fromARGB(255, 0, 255, 247),
                      semanticsLabel: 'topLeftCorner',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(40),
                    height: MediaQuery.of(context).size.height * 0.8 - 120,
                    width: MediaQuery.of(context).size.width * 0.8 - 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(187, 177, 177, 177),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Name: Chloe",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Items remaining: 3",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Mission status: In progress",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  List<Color> get gradient1Colors {
    return [
      const Color.fromARGB(255, 0, 32, 47),
      const Color.fromARGB(255, 0, 20, 29),
      const Color.fromARGB(255, 0, 20, 29),
      const Color.fromARGB(255, 0, 32, 47),
    ];
  }

  List<double> get gradient1Stops {
    return const [
      0.1,
      0.4,
      0.6,
      1.0,
    ];
  }
}
