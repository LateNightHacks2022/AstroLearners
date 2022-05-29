import 'package:flutter/material.dart';

import 'profile.dart';
import 'login_button.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  static var user = Profile("Username", "username@gmail.com", "https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=1600&h=900");
  MyHomePage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          children: const <Widget>[
            Text(
              '<We gonna list their personal stats/info or num of ships here or some shit>',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: const NavigationDrawer(),
    );
  }
  _NavigationDrawer createState() => _NavigationDrawer();
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  static Profile user = MyHomePage.user;
  String name = user.name;
  String imageLink = user.imageLink;
  String email = user.email;

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
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(imageLink),
            ),
            const SizedBox(height: 12),
            Text(name, style: const TextStyle(fontSize: 28)),
            Text(email, style: const TextStyle(fontSize: 15))
          ],
        ),
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
                      builder: (context) => MyHomePage(
                            title: 'AstroLearners',
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
          const Center(child: GoogleSignInButton()),
        ],
      ));
}