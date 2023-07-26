import 'package:flutter/material.dart';
import 'package:sqlite_database/db_helper.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(
            children: [
              //create button
              ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.insertRecord({
                    DatabaseHelper.ColumnName: 'Flutter',
                  });
                },
                child: Text("Insert"),
              ),
              //read button
              ElevatedButton(
                onPressed: () async {
                  var dbquery = await DatabaseHelper.instance.queryRecord();
                  print(dbquery);
                },
                child: Text("Read"),
              ),
              //update button
              ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.update({
                    DatabaseHelper.ColumnId: 1,
                    DatabaseHelper.ColumnName: "Dhaka"
                  });
                },
                child: Text("Update"),
              ),
              //delete button
              ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.deleteRecord(2);
                },
                child: Text("Delete"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
