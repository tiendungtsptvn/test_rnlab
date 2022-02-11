import 'package:rn_lab/data/api/category_api.dart';
import 'package:rn_lab/data/model/category_model.dart';

class CategoryRepository{
  final CategoryApi _api = CategoryApi();
  Future<List<CategoryModel>> getCategories() async{
    return _api.getCategories();
  }
}