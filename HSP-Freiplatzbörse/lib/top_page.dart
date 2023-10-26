import 'package:flutter/material.dart';

import 'delete_page.dart';
import 'insert_page.dart';
import 'read_all_page.dart';
import 'select_page.dart';
import 'attendee_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const SizedBox(height: 200),
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            'HSP - Freiplatzbörse',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ReadAllPage(title: 'Flutter MySQL Insert Sample'),
                ),
              );
            },
            child: const Text(
              "See Courses",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const InsertPage(title: 'Flutter MySQL Insert Sample'),
                ),
              );
            },
            child: const Text(
              "Add a course",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const SelectPage(title: 'Flutter MySQL Select Sample'),
                ),
              );
            },
            child: const Text(
              "Select Course to Apply",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DeletePage(title: 'Flutter MySQL Delete Sample'),
                ),
              );
            },
            child: const Text(
              "Delete Course",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AttendeePage(
                      title: 'Flutter MySQL Attendees Sample'),
                ),
              );
            },
            child: const Text(
              "Attendees for Course",
            ),
          ),
        ),
      ],
    )));
  }
}
