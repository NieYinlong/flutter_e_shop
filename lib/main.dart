import 'package:flutter/material.dart';
import  './pages/index_page.dart';
import './consts.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  var counter = Counter();
  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter));
  // ..provide(Provider<Counter>.value(counter)); // 其他的
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

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
