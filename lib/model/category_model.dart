import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CategoryModel {
  int categoryId;
  String categoryName;
  String image;

  CategoryModel({this.categoryId, this.categoryName, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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

class CategoryListModel {
  List <CategoryModel> list;
  CategoryListModel(this.list);
  
 factory CategoryListModel.fromJson(List jsonList) {
    return CategoryListModel(
      jsonList.map((i) => CategoryModel.fromJson(i)).toList()
    );
  }
}




// class CategoryModel {
//   int categoryId;
//   String categoryName;
//   List<dynamic> subDot;
//   Null comments;
//   String image;
//   CategoryModel({
//     this.categoryId,
//     this.categoryName,
//     this.subDot,
//     this.comments,
//     this.image
//   });
//   // 工厂函数
//   factory CategoryModel.fromJson(dynamic json) {
//     return CategoryModel(
//       categoryId: json['categoryId'],
//       categoryName: json['categoryName'],
//       // subDot: json['subDot'],
//       // comments: json['comments'],
//       image: json['image'],
//     );
//   }
// }

// class CategoryListModel2 {
//   List <CategoryModel> data;
//   CategoryListModel2(this.data);

//   factory CategoryListModel2.fromJson(List json) {
//     return CategoryListModel2(
//       json.map((i) => CategoryModel.fromJson(i)).toList()
//     );
//   }
// }




