import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/config/service_method.dart';
import 'package:flutter_e_shop/config/service_url.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/category_model.dart';
import './widgets/category_left_nav.dart' show LeftNav;
import './widgets/category_right_content.dart' show RightContent;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  CategoryListModel modelList;

  @override
  void initState() {
    super.initState();
    test();
  }

  test() {
      
    requestGET(API.CATEGORY, null).then((value) {
      CategoryListModel list = CategoryListModel.fromJson(value['data']);
      setState(() {
        modelList = list;
      });
      // list.data.forEach((item) {
      //   print(item.categoryName);
      // });

      // MyModel model = MyModel.fromJson2(value['data'][0]);
      // print('------');
      // print(model.categoryName);
    });
  }


  @override
  Widget build(BuildContext context) {
    // test();
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类', style: TextStyle(fontSize: ScreenUtil().setHeight(24)),),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftNav(categoryList: ,),
            RightContent(),
          ]
        )
      ),
    );
  }    
}


// class Rectangle {
//   num left, top, width, height;

//   Rectangle(this.left, this.top, this.width, this.height);

//   // 定义两个计算属性： right 和 bottom。
//   num get right => left + width;
//   set right(num value) => left = value - width;
//   num get bottom => top + height;
//   set bottom(num value) => top = value - height;
// }
