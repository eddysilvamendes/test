import 'package:get/get.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/uitls/app_constants.dart';

class CategoriesRepo extends GetxService {
  final ApiClient apiClient; //instance of apiclient

  CategoriesRepo({required this.apiClient});

  Future<Response> getCategoriesList() async {
    return await apiClient.getData(AppConstants.CATEGORIES_URI);
  }
}
