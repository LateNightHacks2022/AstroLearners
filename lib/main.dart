import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'firebase_options.dart';
import 'home.dart';

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
      // home: const MissionLog(title: "Chloe Misison Log"),
      home: const MyHomePage(title: 'AstroLearners'),
    );
  }
}

class NewPlanetSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPlanetSelectionState();
  }
}

class _NewPlanetSelectionState extends State<NewPlanetSelection> {
  final _textController0 = TextEditingController();
  final _textController1 = TextEditingController();
  String planetName = ' ';
  String examDate = ' ';
  String planetColour = 'earth2';
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
        backgroundColor: Colors.indigo,
        title: const Center(child: Text("Add New Planet")),
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
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        planetColour = 'Green';
                      });
                    },
                    child: Text('Green'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, onPrimary: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        planetColour = 'Black';
                      });
                    },
                    child: Text('Black'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, onPrimary: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        planetColour = 'White';
                      });
                    },
                    child: Text('White'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, onPrimary: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        planetColour = 'Pink';
                      });
                    },
                    child: Text('Pink'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink, onPrimary: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        planetColour = 'Blue';
                      });
                    },
                    child: Text('Blue'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                  ),
                ),
              ],
            )),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/images/$planetColour.jpg',
                    height: 400,
                    width: 1000,
                  ),
                  Text(planetName)
                ],
              ),
            ),
            Text(
                'Planet Name is $planetName \nPlanet Depature Date is $examDate \nPlanet Colour is $planetColour'),
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
        drawer: const NavigationDrawer(),
      ),
    );
  }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
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
                  alignment: Alignment.topLeft,
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
                    height: MediaQuery.of(context).size.height * 0.9 - 130,
                    width: MediaQuery.of(context).size.width * 0.9 - 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color.fromARGB(187, 177, 177, 177),
                    ),
                    child: TodoList(),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9 - 10,
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.topRight,
                  child: Text(
                    widget.title,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontFamily: "Oxanium",
                        fontSize: 28,
                        color: Color.fromARGB(255, 0, 255, 247)),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 0, 255, 247)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    }, // Handle your callback
                    child: Ink(
                      color: Color.fromARGB(255, 0, 255, 247),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: const Text(
                          "< Back",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontFamily: "Oxanium",
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 255, 247),
                          ),
                        ),
                      ),
                    ),
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
      Color.fromARGB(255, 0, 71, 107),
      Color.fromARGB(255, 0, 47, 68),
      Color.fromARGB(255, 0, 47, 68),
      Color.fromARGB(255, 0, 71, 107),
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

class Todo {
  Todo(
      {required this.docId,
      required this.name,
      required this.checked,
      required this.priority});
  final String docId;
  final String name;
  bool checked;
  int priority;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) {
      return const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontFamily: "Oxanium",
        fontSize: 14,
      );
    } else {
      return const TextStyle(
        color: Color.fromARGB(255, 128, 128, 128),
        decoration: TextDecoration.lineThrough,
        fontFamily: "Oxanium",
        fontSize: 14,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        backgroundColor: (todo.checked
            ? const Color.fromARGB(255, 77, 77, 77)
            : const Color.fromARGB(255, 0, 255, 247)),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        child: Text(todo.priority.toString()),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();

  final List<Todo> _todos = <Todo>[];

  int priotityCount = 0;

  final Stream<QuerySnapshot> _todosStream = FirebaseFirestore.instance
      .collection('AstroLearnersTODOS')
      .doc("Shc3Dcj0YRaIqUBg50RP")
      .collection("TODOS")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _todosStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Scaffold(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          body: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return TodoItem(
                  todo: Todo(
                      docId: document.id as String,
                      name: data['name'] as String,
                      checked: data['checked'] as bool,
                      priority: data['priority'] as int),
                  onTodoChanged: _handleTodoChange,
                );
              }).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 0, 255, 247),
              foregroundColor: Color.fromARGB(255, 0, 0, 0),
              onPressed: () => _displayDialog(),
              tooltip: 'Add Item',
              child: const Icon(Icons.add_task)),
        );
      },
    );
  }

  void _handleTodoChange(Todo todo) async {
    await FirebaseFirestore.instance
        .collection("AstroLearnersTODOS")
        .doc("Shc3Dcj0YRaIqUBg50RP")
        .collection("TODOS")
        .doc(todo.docId)
        .update({
      "checked": !todo.checked,
    });
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name, int priority, bool checked) async {
    final DocumentReference docId = await FirebaseFirestore.instance
        .collection("AstroLearnersTODOS")
        .doc("Shc3Dcj0YRaIqUBg50RP")
        .collection("TODOS")
        .add({
      "name": name,
      "priority": priority,
      "checked": checked,
    });

    setState(() {
      _todos.add(Todo(
          docId: docId.id, name: name, checked: checked, priority: priority));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    final String todoName;
    final int todoPriority;
    int dropdownValue = 1;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            title: const Text('Add a new task'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      hintText: "Task Name",
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue.toString(),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = int.parse(newValue!);
                      });
                    },
                    items:
                        <int>[1, 2].map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Add'),
                onPressed: () {
                  _addTodoItem(_textFieldController.text, dropdownValue, false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
