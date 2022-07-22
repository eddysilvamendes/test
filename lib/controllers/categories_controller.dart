import 'package:get/get.dart';
import 'package:shopping_app/data/repos/categories_repo.dart';
import 'package:shopping_app/models/categories_model.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});
  List<dynamic> _categoriesList = [];
  List<dynamic> get categoriesList => _categoriesList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getCategoriesList() async {
    Response response = await categoriesRepo.getCategoriesList();
    if (response.statusCode == 200) {
      print("Got Categories Data");
      _categoriesList = [];
      _categoriesList.addAll(Categories.fromJson(response.body).categories);
      _isLoaded = true;

      update(); //more like a set state for UI

    } else {
      print("Could not get Categories");
    }
  }
}
