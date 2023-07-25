import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DatabaseScreen(),
    );
  }
}

class DatabaseScreen extends StatelessWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //create button
            ElevatedButton(onPressed: () {}, child: Text("Create")),
            //read button
            ElevatedButton(onPressed: () {}, child: Text("Read")),
            //update button
            ElevatedButton(onPressed: () {}, child: Text("Update")),
            //delete button
            ElevatedButton(onPressed: () {}, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
