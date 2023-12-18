import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  List<Widget> _widget = <Widget>[
    MyListView(),
    Text('asdf2'),
    UserProfile(),
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

/* list view */
class MyListItem extends StatelessWidget {
  final String title;

  MyListItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${title}_sub_description'),
      // 其他列表項目的配置...
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', '我想問卦'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MyListItem(title: items[index]); // 將MyListItem添加到ListView中
      },
    );
  }
}

/* profile */
class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(Icons.icecream, color: Colors.blue, size: 32,),
            Text('帳號:${'pypy'}', style: TextStyle(fontSize: 24) ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.icecream, color: Colors.blue, size: 32,),
            Text('信箱:${'email@gmail.com'}', style: TextStyle(fontSize: 24), ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.numbers, color: Colors.blue, size: 32),
            Text('發文數量${'10'}', style: TextStyle(fontSize: 24,color: Colors.blue),),
          ],
        ),
        Row(
          children: [
            Icon(Icons.numbers, color: Colors.blue, size: 32),
            Text('回文數量${'31'}', style: TextStyle(fontSize: 24,color: Colors.blue),),
          ],
        )
      ],
    );
  }
}



