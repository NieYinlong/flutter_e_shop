import 'package:flutter/material.dart';
import  './pages/index_page.dart';
import './consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '聂银龙',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.ThemeColor
        ),
        home: IndexPage(),
      ),
    );
  }
}
