import 'package:dio/dio.dart';
import 'package:ieee_e_commerce_app/model/product_responce.dart';

class ApiManager {
  Dio dio = Dio();
  String api = "https://api.escuelajs.co/api/v1/products";
  Future<List<ProductResponce>> getAllProducts() async {
    final responce = await dio.get(api);
    List<dynamic> data = responce.data;
    return data.map((item) => ProductResponce.fromjson(item)).toList();
  }

  Future<List<ProductResponce>> getSearchProducts(String query) async {
    if (query.trim().isEmpty) return [];
    final responce = await dio.get(api);
    List<dynamic> data = responce.data;
    List<ProductResponce> jsonMap =
        data.map((item) => ProductResponce.fromjson(item)).toList();
    List<ProductResponce> filteredjsonMap = jsonMap
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredjsonMap;
  }
}
