import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

import 'domain/format.dart';

class AttendeePage extends StatefulWidget {
  const AttendeePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AttendeePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<AttendeePage> {
  var res = '';
  var targetId = ''; // id to update
  var targetTerm = ''; // column name to update
  int newTerm = 0; // new data to replace

  Future<void> _update() async {
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

    // update some rows
    var res = await conn.execute(
      "SELECT * FROM UserAppliedSport WHERE SportID = :SportID",
      {
        "SportID": targetTerm,
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
                  hintText: "Sport ID",
                  onChanged: (text) {
                    newTerm = text as int;
                  },
                )),
            const Text(
              'Push button to Apply',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _update,
        tooltip: 'update',
        label: const Text("See"),
      ),
    );
  }
}
