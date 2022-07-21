import 'package:get/get.dart';
import 'package:shopping_app/data/repos/categories_repo.dart';
import 'package:shopping_app/data/repos/cheff_repo.dart';
import 'package:shopping_app/models/categories_model.dart';
import 'package:shopping_app/models/cheff_model.dart';
import 'package:shopping_app/models/response_model.dart';

class CheffController extends GetxController {
  final CheffRepo cheffRepo;

  CheffController({required this.cheffRepo});
  List<dynamic> _cheffList = [];
  List<dynamic> get cheffList => _cheffList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  CheffModel? _cheffModel;
  CheffModel? get cheffModel => _cheffModel;

  Future<void> getCheffList() async {
    Response response = await cheffRepo.getCheffList();
    if (response.statusCode == 200) {
      print("Got Cheff Data");
      _cheffList = [];
      _cheffList.addAll(Cheff.fromJson(response.body).cheff);
      _isLoaded = true;

      print("tamanho da lista cheff " + cheffList.length.toString());

      update(); //more like a set state for UI

    } else {
      print("Could not get Cheff");
    }
  }

  /*Future<ResponseModel> getCheffList() async {
    ResponseModel _responseModel;
    Response response = await cheffRepo.getCheffList();
    if (response.statusCode == 200) {
      _cheffModel = CheffModel.fromJson(response.body);

      _responseModel = ResponseModel(true, 'successful');
      // _isLoading=true;
    } else {
      _responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return _responseModel;
  }*/
}
