import 'package:flutter/material.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_e_shop/model/category_model.dart';
import 'package:flutter_e_shop/provide/sub_category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class RightContent extends StatefulWidget {
  @override
  _RightContentState createState() => _RightContentState();
}

class _RightContentState extends State<RightContent> {
  
  List _goodsList = ['运动鞋', '跑步鞋', '足球鞋'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _topSubStype(),
          Expanded(child: _bottomListView())
        ]
      ),
    );
  }

  Widget _topSubStype() {
    // List list = ['运动鞋', '跑步鞋', '足球鞋', '运动鞋', '跑步鞋', '足球鞋'];
    return Provide<SubCategory>(
      builder: (context, child, subCategory) {
        return Container(
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(24)),
       decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategory.subCategoryList.length,
        itemBuilder: (context, index) {
          return _topSubStypeItem(subCategory.subCategoryList[index]);
        }
      )
    );
      },
    );
    // return 
  }

  Widget _topSubStypeItem(SubTypeModel subModel) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text('${subModel.subName}'),
    );
  }

  // Widget _bottomListView() {
  //   return GridView(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 2,
  //       mainAxisSpacing: 2
  //     ),
  //     children: <Widget>[
  //       _bottomListViewItem('1'),
  //       _bottomListViewItem('2'),
  //       _bottomListViewItem('3'),
  //     ],
  //   );
  // }


  Widget _bottomListView() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
    ),
    itemCount: _goodsList.length,
     itemBuilder: (context, index) {
       return _bottomListViewItem(_goodsList[index]);
     }
    );
  }


  Widget _bottomListViewItem(str) {
    return Container(
      width: 10,
      color: Colors.yellow,
      height: 120,
      child: Text('$str'),
    );
  }

}