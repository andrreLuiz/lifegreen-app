import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    try {
      final result = await _httpManager.restRequest(
        url: Endpoints.getAllCategories,
        method: HttpMethods.post,
      );

      print('Resultado da requisição: $result');

      if (result['result'] != null) {
        final rawList = result['result'] as List;
        List<CategoryModel> data =
            rawList
                .map(
                  (item) =>
                      CategoryModel.fromJson(item as Map<String, dynamic>),
                )
                .toList();

        return HomeResult<CategoryModel>.success(data);
      } else {
        return HomeResult.error(
          result['error'] ?? 'Erro ao recuperar as categorias',
        );
      }
    } catch (e) {
      return HomeResult.error('Erro de conexão: $e');
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(
    Map<String, dynamic> body,
  ) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllProducts,
      method: HttpMethods.post,
      body: body,
    );

    if (result['result'] != null) {
      List<ItemModel> data =
          List<Map<String, dynamic>>.from(
            result['result'],
          ).map(ItemModel.fromJson).toList();

      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(
        'Ocorreu um erro inesperado ao recuperar os itens',
      );
    }
  }
}
