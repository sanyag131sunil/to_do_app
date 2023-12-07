import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/home_page.dart';

void main() async {
//init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Welcome to To Do App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'READ THE INSTRUCTIONS BELOW',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tap on click me button to start making your to do list.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'In order to add a new text, tap on + button.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'To delete a task, swipe that task from right to left',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageContent()),
                );
              },
              child: Text('CLICK ME'),
            ),
          ],
        ),
      ),
    );
  }
}
