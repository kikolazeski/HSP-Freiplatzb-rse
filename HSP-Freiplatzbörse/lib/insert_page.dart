import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

import 'domain/format.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  var name = '';
  var description = '';
  var date = '';
  var time = '';
  var place = '';
  var price = 1;
  var afp = false;

  Future<void> _insert() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      //host: "127.0.0.1",   //when you use simulator
      host: "10.0.2.2", //when you use emulator
      //host: "localhost"
      port: 3306,
      userName: "root",
      password: "root", // you need to replace with your password
      databaseName: "sportsmanagement", // you need to replace with your db name
    );

    await conn.connect();

    print("Connected");

    // insert some rows
    var res = await conn.execute(
      "INSERT INTO Sport (SportID, Name, Description, Date, Time, Place, Price, TeacherID, AppliedForPlaces) VALUES (:SportID, :Name, :Description, :Date, :Time, :Place, :Price, :TeacherID, :AppliedForPlaces)",
      {
        "SportID": null, //if you set it auto increment
        "Name": name,
        "Description": description,
        "Date": date,
        "Time": time,
        "Place": place,
        "Price": price,
        "TeacherID": null,
        "AppliedForPlaces": afp,
      },
    );

    print(res.affectedRows);

    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Format(
                  hintText: "name",
                  onChanged: (text) {
                    name = text;
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Format(
                  hintText: "Description",
                  onChanged: (text) {
                    description = text;
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Format(
                  hintText: "date",
                  onChanged: (text) {
                    date = text;
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Format(
                  hintText: "time",
                  onChanged: (text) {
                    time = text;
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Format(
                  hintText: "place",
                  onChanged: (text) {
                    place = text;
                  },
                )),
            const Text(
              'Push button to insert',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _insert,
        tooltip: 'insert',
        label: const Text("insert"),
      ),
    );
  }
}
