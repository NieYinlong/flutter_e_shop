import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftNav extends StatefulWidget {
  @override
  _LeftNavState createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1)
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return itemCell(index, {});
        }
      )
    );
  }

  Widget itemCell(index, item) {
    return InkWell(
      onTap: () {},
      child: Container(
        
        child: Text('ss')
      )
    );
  }

}