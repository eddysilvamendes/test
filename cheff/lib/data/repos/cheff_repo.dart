import 'package:get/get.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/uitls/app_constants.dart';

class CheffRepo extends GetxService {
  final ApiClient apiClient; //instance of apiclient

  CheffRepo({required this.apiClient});

  Future<Response> getCheffList() async {
    return await apiClient.getData(AppConstants.CHEFF_URI);
  }
}
