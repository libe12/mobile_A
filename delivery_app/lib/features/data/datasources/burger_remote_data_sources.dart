import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delivery_app/features/data/models/burger_model.dart';

abstract class BurgerRemoteDataSource {
  Future<List<BurgerModel>> getBurgersFromApi();
}

class BurgerRemoteDataSourceImpl implements BurgerRemoteDataSource {
  final http.Client client;

  BurgerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BurgerModel>> getBurgersFromApi() async {
    final response = await client.get(Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List)
          .map((burger) => BurgerModel.fromJson(burger))
          .toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }
}
