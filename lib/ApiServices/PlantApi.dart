import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/PlantModel.dart';

class ApiServicePlant {
  final String baseUrl = "https://trefle.io/api/v1";
  final String baseUrl2 = "https://trefle.io";
  final String token = "BvXGm_MXRBZZJPkI28Mc6749O0DXpUYUcODyZkMB8NY";

  Future<List<PlantSpecies>> fetchData({
    int page = 1,
  }) async {
    String queryParams = '?token=BvXGm_MXRBZZJPkI28Mc6749O0DXpUYUcODyZkMB8NY'
        '&page=$page';
    Uri uri = Uri.parse('$baseUrl/plants$queryParams');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> speciesData = data['data'];

      List<PlantSpecies> speciesList = speciesData.map((json) => PlantSpecies.fromJson(json)).toList();

      return speciesList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<PlantSpecies>> SearchfetchData({
    int page = 1,
    String? search,
  }) async {
    String queryParams = '?token=BvXGm_MXRBZZJPkI28Mc6749O0DXpUYUcODyZkMB8NY'
        '&page=$page'
        '&q=$search';
    Uri uri = Uri.parse('$baseUrl/plants/search$queryParams');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> speciesData = data['data'];

      List<PlantSpecies> speciesList =
      speciesData.map((json) => PlantSpecies.fromJson(json)).toList();

      return speciesList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<PlantDetail> fetchPlantDetail(String links) async {
    String queryParams = '?token=$token';
    Uri uri = Uri.parse('$baseUrl2$links$queryParams');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return PlantDetail.fromJson(data['data']);
    } else {
      throw Exception('Failed to load plant detail');
    }
  }
}