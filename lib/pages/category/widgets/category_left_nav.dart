import 'package:flutter/material.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_e_shop/model/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/sub_category.dart';

class LeftNav extends StatefulWidget {

  LeftNav({Key key, this.list}) : super(key: key);
  final List <CategoryModel>list;

  @override
  _LeftNavState createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {

@override
void initState() { 
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red, width: 1)
      // ),
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          var item = widget.list[index];
          return _itemCell(item, index);
        }
      )
    );
  }

  Widget _itemCell(item, index) {
    return InkWell(
      onTap: () {
         var subList = widget.list[index].subTypes;
         Provide.value<SubCategory>(context).getSubCategory(subList);
      },
      child: Container(
        height: ScreenUtil().setWidth(100),
        padding: EdgeInsets.only(left: 10, top:20),
        decoration: BoxDecoration(
          color: index == 1 ? Colors.white : AppColors.BgGrayColor,
          // border: Border(
          //   bottom: BorderSide(width: 1, color: Colors.black12)
          // )
        ),
        child: Text(item.categoryName),
      )
    );
  }

}