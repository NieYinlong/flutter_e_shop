import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubCategory with ChangeNotifier {
  
  List<SubTypeModel> subCategoryList = [];

  getSubCategory(List list) {
    subCategoryList = list;
    notifyListeners();
  }
}