
import 'package:rn_lab/bloc_base/bloc_provider.dart';
import 'package:rn_lab/data/model/category_model.dart';
import 'package:rn_lab/data/repository/category_repository.dart';
import 'package:rxdart/rxdart.dart';


class ListCategoryBloc extends BlocBase{
  final CategoryRepository _categoryRepository = CategoryRepository();
  ListCategoryBloc() {
    _bind();
  }

  final BehaviorSubject<List<CategoryModel>> _categoriesValue = BehaviorSubject();
  Sink<List<CategoryModel>> get categoriesSink => _categoriesValue.sink;
  Stream<List<CategoryModel>> get categoriesStream => _categoriesValue.stream;

  List<CategoryModel> categories = [];

  @override
  void init() async {
    getCategories();
    super.init();
  }

  void _bind() {}

  Future<void> getCategories()async{
    try{
      categories = await _categoryRepository.getCategories();
      if(categories.isNotEmpty){
        _categoriesValue.add(categories);
      }
    }catch(e){
      print("error at bloc");
    }
  }
  @override
  void dispose() {
    _categoriesValue.close();
  }
}
