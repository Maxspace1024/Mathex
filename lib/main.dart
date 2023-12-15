import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectIndex = 0;

  static const List<Widget> _widget = <Widget>[
    Text('asdf3'),
    Text('asdf2'),
    Text('asdf1')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Mathex'),
        backgroundColor: Colors.yellow[300],
      ),
      body: Center(
          child: _widget.elementAt(_selectIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: '問題'),
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: '新增'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: '關於個人'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.yellow[900],
        onTap: _onItemTapped,
      ),
    );
  }
}


