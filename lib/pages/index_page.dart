import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // iOS风格的组件
import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('会员中心')
    ),
  ];

  final List tabBodies = [
      HomePage(),
      CategoryPage(),
      CartPage(),
      MemberPage(),
  ];

  int _currentIndex = 0; // 当前索引
  Widget _selectedPage; // 当前选中的页面

  @override
  void initState() {
    _selectedPage = tabBodies[_currentIndex];
    print('当前页 $_selectedPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _selectedPage = tabBodies[_currentIndex];
          });
        },
      ),
      body: _selectedPage,
    );
  }
}
