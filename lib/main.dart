import 'package:flutter/material.dart';

/*
 * colour of planet
 * var planetColour = 'white';
 * name of subject
 * var planetName = 'beta';
 * date of subject exam
 * final departureDate = DateTime.now().add(const Duration(days: 30));
 */

void main() {
  runApp(const MyApp());
  return;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _textController0 = TextEditingController();
  final _textController1 = TextEditingController();
  String planetName = ' ';
  String examDate = ' ';
  String planetColour = ' ';
  bool isWhite = false;
  bool isBlack = false;
  bool isPink = false;
  bool isBlue = false;
  bool confirmSelection = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('AstroLearners'),
          ),
          backgroundColor: const Color.fromARGB(255, 38, 65, 218),
        ),
        body: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: _textController0,
              decoration: const InputDecoration(
                hintText: 'What\'s your planet name?',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  planetName = _textController0.text;
                });
              },
              color: Colors.green,
              child: const Text('Apply', style: TextStyle(color: Colors.white)),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: _textController1,
              decoration: const InputDecoration(
                hintText: 'What\'s your departure date (DDMMYYYY)?',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  examDate = _textController1.text;
                });
              },
              color: Colors.green,
              child: const Text('Apply', style: TextStyle(color: Colors.white)),
            ),
            const Text(
              'What\'s your planet colour?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 830),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isWhite = true;
                        planetColour = 'White';
                      });
                    },
                    child: Text('White'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, onPrimary: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBlack = true;
                        planetColour = 'Black';
                      });
                    },
                    child: Text('Black'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, onPrimary: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPink = true;
                        planetColour = 'Pink';
                      });
                    },
                    child: Text('Pink'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink, onPrimary: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBlue = true;
                        planetColour = 'Blue';
                      });
                    },
                    child: Text('Blue'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                  ),
                ),
              ],
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/earth2.jpg',
                    height: 400,
                    width: 1000,
                  ),
                  Text(planetName)
                ],
              ),
            ),
            Text(
                'Planet Name is $planetName \nPlanet Depature Date is $examDate \nPlanet Color is $planetColour'),
            MaterialButton(
              onPressed: () {
                setState(() {
                  confirmSelection = true;
                });
              },
              color: Colors.green,
              child: const Text('Confirm Selection',
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
