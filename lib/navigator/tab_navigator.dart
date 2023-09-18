import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/travel_page.dart';
import 'package:flutter_app/pages/my_page.dart';

class TabNavigator extends StatefulWidget{
  // const TabNavigator({Key? key}):super(key: key);
  @override
  _TabNavigatorState createState() =>_TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{
  final PageController _controller=PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
          ),label: '首页'
          // Text('首页', style: TextStyle(
          //   color: _currentIndex!=1?_defaultColor:_activeColor))
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.search,
          ),label: '搜索',
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.camera_alt,
          ),label: '旅拍'),
          BottomNavigationBarItem(icon: Icon(
            Icons.account_circle,
          ),label: '我的')
        ]
      ),
    );
  }
}