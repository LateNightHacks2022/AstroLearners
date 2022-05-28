import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'navigation_drawer.dart'; // new
import './authentication.dart';
import './firebase_options.dart';

import 'package:late_nighthacks/login_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web);
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weh Night Hacks 2022'),
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
              'assets/images/rocket.png',
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
  const NavigationDrawer({Key? key, User? user})
      : super(key: key);

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
                            title: 'Weh Night Hacks 2022',
                          )));
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
                    builder: (context) => const StudyPlanet("Physics Planet")),
              );
            },
          ),
          Center(child: GoogleSignInButton()),
        ],
      ));
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
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          // grey box
          width: 320,
          height: 240,
          color: Colors.grey[300],
          child: Center(
            child: Container(
              // red box
              width: 240, // max-width is 240
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[400],
              ),
              child: Text(
                'Lorem ipsum',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
      drawer: const NavigationDrawer(),
    );
  }
}
