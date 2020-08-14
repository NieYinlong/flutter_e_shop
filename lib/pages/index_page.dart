import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // iOS风格的组件
import './home/home_page.dart';
import './category/category_page.dart';
import './cart_page.dart';
import './member_page.dart';
import './test_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/service_method.dart';
import '../config/service_url.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/tab_home_gray.png', width: 25,),
      activeIcon: Image.asset('assets/images/tab_home_colorful.png', width: 25,),
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

     BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.play_arrow_solid),
        activeIcon: Image.asset('assets/images/tab_other_colorful.png', width: 25,),
        title: Text('测试页')
    ),
  ];   


  final List<Widget> _tabBodies = [
      HomePage(),
      CategoryPage(),
      CartPage(),
      MemberPage(),
      TestPage()
  ];

  int _currentIndex = 0; // 当前索引
  Widget _selectedPage; // 当前选中的页面

  @override
  void initState() {
    _selectedPage = _tabBodies[_currentIndex];
    print('当前页 $_selectedPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //全局初始化屏幕适配
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _selectedPage = _tabBodies[_currentIndex];
          });
        },
      ),
      // body: _selectedPage,
      body: IndexedStack(
        index: _currentIndex,
        children: _tabBodies,
      ),
    );
  }
}
