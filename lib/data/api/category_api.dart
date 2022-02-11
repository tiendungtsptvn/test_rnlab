import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rn_lab/data/model/category_model.dart';
///const
const categoryUrl = 'https://wc.appcheap.io/wp-json/app-builder/v1/categories';

class CategoryApi{
  CategoryApi();

  Future<List<CategoryModel>> getCategories() async{
    final response = await http.Client().get(Uri.parse(categoryUrl));
    if(response.statusCode != 200){
      throw Exception("Get category error");
    }
    final List<CategoryModel> list = [];
    final body = jsonDecode(response.body);
    if(body != null){
      print("__________");
      print(body.toString());
      print("__________");
    }
    for(dynamic item in body){
      list.add(CategoryModel.fromJson(item));
    }
    return list;
  }
}