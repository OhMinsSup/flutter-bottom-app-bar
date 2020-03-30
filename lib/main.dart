import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.lightBlue,
    ),
    Container(
      color: Colors.yellowAccent,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          body: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => this._onItemTapped(1),
            child: Icon(Icons.games),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: _newBnb()),
    );
  }

  Widget _newBnb() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => _onItemTapped(0),
          ),
          IconButton(
            icon: Icon(Icons.business),
            onPressed: () => _onItemTapped(2),
          ),
        ],
      ),
    );
  }

  Widget _bnb() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text("Business")),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text("School")),
      ],
    );
  }
}

// 기본 네비게이션
//return MaterialApp(
//home: Scaffold(
//body: IndexedStack(
//index: _selectedIndex,
//children: _widgetOptions,
//),
//floatingActionButton: FloatingActionButton(
//onPressed: () {},
//child: Icon(Icons.games),
//),
//floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//bottomNavigationBar: BottomNavigationBar(
//type: BottomNavigationBarType.shifting,
//selectedItemColor: Colors.black87,
//unselectedItemColor: Colors.grey,
//onTap: _onItemTapped,
//currentIndex: _selectedIndex,
//items: <BottomNavigationBarItem>[
//BottomNavigationBarItem(
//icon: Icon(Icons.home), title: Text("Home")),
//BottomNavigationBarItem(
//icon: Icon(Icons.business), title: Text("Business")),
//BottomNavigationBarItem(
//icon: Icon(Icons.school), title: Text("School")),
//],
//),
//),
//);
