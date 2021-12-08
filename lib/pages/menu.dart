import 'package:amica/pages/favorite.dart';
import 'package:amica/pages/person.dart';
import 'package:amica/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int index = 0;

  final pages = [
    Home(),
    Favorite(),
    Settings(),
    Person()
  ];

  // ignore: non_constant_identifier_names
  does_nothing() {}

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      const Icon(Icons.home, size:30),
      const Icon(Icons.favorite, size:30),
      const Icon(Icons.settings, size:30),
      const Icon(Icons.person, size:30),
    ];

    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.black87)
        ),
        child: CurvedNavigationBar(
          height: 55,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      body: pages[index],
     );
  }
}
