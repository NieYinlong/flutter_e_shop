import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Column(
        children: <Widget>[
          Number(),
          AddButton(),
          SubButton()
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Container(
          child: Provide<Counter>(
            builder: (context, child, counter) {
              return Text('${counter.value}', style: TextStyle(fontSize: 33),);
            }
        )
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () { 
          Provide.value<Counter>(context).increment();
        },
        child: Text('++递增'),
      ),
    );
  }
}

class SubButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Provide.value<Counter>(context).subFunc();
        },
        child: Text('递减--'),
      ),
    );
  }
}
