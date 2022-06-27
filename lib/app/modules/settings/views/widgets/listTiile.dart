// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

// ignore: must_be_immutable
class MylistTile extends StatelessWidget {
  MylistTile({Key? key, this.icon, this.name}) : super(key: key);

  IconData? icon;
  String? name;

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(
                icon,
                size: 30,
              ),
              title: Text('${name}'),
            ),
          ),
        ),
      ],
    );
  }
}
