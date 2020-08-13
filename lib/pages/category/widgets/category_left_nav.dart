import 'package:flutter/material.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_e_shop/model/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftNav extends StatefulWidget {

  LeftNav({Key key, this.categoryList}) : super(key: key);
  final CategoryListModel categoryList;

  @override
  _LeftNavState createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red, width: 1)
      // ),
      child: ListView.builder(
        itemCount: widget.categoryList.data.length,
        itemBuilder: (context, index) {
          var item = widget.categoryList.data[index];
          return _itemCell(item, index);
        }
      )
    );
  }

  Widget _itemCell(item, index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setWidth(100),
        padding: EdgeInsets.only(left: 10, top:20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
            )
        ),
        child: Text(item.categoryName),
      )
    );
  }

}