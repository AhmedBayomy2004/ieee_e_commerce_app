import 'package:dio/dio.dart';
import 'package:ieee_e_commerce_app/model/product_responce.dart';
import 'package:ieee_e_commerce_app/model/register_responce.dart';

class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.escuelajs.co/api/v1/"));

  Future<List<ProductResponce>> getAllProducts() async {
    final responce = await dio.get('products');
    List<dynamic> data = responce.data;
    return data.map((item) => ProductResponce.fromjson(item)).toList();
  }

  Future<List<ProductResponce>> getSearchProducts(String query) async {
    if (query.trim().isEmpty) return [];
    final responce = await dio.get('products');
    List<dynamic> data = responce.data;
    List<ProductResponce> jsonMap =
        data.map((item) => ProductResponce.fromjson(item)).toList();
    List<ProductResponce> filteredjsonMap = jsonMap
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredjsonMap;
  }

  Future<RegisterResponce?> register(
      String name, String email, String password) async {
    try {
      final respoce = await dio.post("users", data: {
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://picsum.photos/800",
      });
      return respoce.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<RegisterResponce?> login(String email, String password) async {
    try {
      final respoce = await dio.post("auth/login", data: {
        "email": email,
        "password": password,
      });
      return respoce.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
