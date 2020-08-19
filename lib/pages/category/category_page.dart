import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_shop/config/service_method.dart';
import 'package:flutter_e_shop/config/service_url.dart';
import 'package:flutter_e_shop/provide/sub_category.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/category_model.dart';
import './widgets/category_left_nav.dart' show LeftNav;
import './widgets/category_right_content.dart' show RightContent;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List <CategoryModel> _leftList = [];

  @override
  void initState() {
    super.initState();
    reqList();
  }

  reqList() {
      
    requestGET(API.CATEGORY, null).then((value) {
  
        // 方法1, 把model添加到数组
        List dataArr = value['data'];
        List <CategoryModel> tmpList= [];
        dataArr.forEach((e) => {
          tmpList.add(CategoryModel.fromJson(e))
        });

        // 方法2 封装: 把list 封装到一个model, 取出.list即可
        CategoryListModel listModel = CategoryListModel.fromJson(value['data']);

        setState(() {
          // 方法 1 的赋值
          //_leftList = tmpList;
          // 方法 2 的赋值
          _leftList = listModel.list;
        });
        // 默认选中第0项
        Provide.value<SubCategory>(context).getSubCategory(listModel.list[0].subTypes);

      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类', style: TextStyle(fontSize: ScreenUtil().setHeight(24)),),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftNav(list: _leftList),
            Flexible(child: RightContent())
          ]
        )
      ),
    );
  }    
}