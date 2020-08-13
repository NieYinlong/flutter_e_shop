import 'dart:convert';
import 'package:flutter/material.dart';

class CategoryModel {
  int categoryId;
  String categoryName;
  List<dynamic> subDot;
  Null comments;
  String image;
  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.subDot,
    this.comments,
    this.image
  });
  // 工厂函数
  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      // subDot: json['subDot'],
      // comments: json['comments'],
      image: json['image'],
    );
  }
}

class CategoryListModel {
  List <CategoryModel> data;
  CategoryListModel(this.data);

  factory CategoryListModel.fromJson(List json) {
    return CategoryListModel(
      json.map((i) => CategoryModel.fromJson(i)).toList()
    );
  }
}




// 测试, 未使用
class MyModel {
  int categoryId;
  String categoryName;
  String image;

  MyModel({this.categoryId, this.categoryName, this.image});

  MyModel.fromJson2(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['image'] = this.image;
    return data;
  }


}

class ScreenU {
  // 静态方法(类方法)
   static void init(num width, num height, String sex) {

  }

  te() {
    init(1, 1, "sex");
    
  }
}



