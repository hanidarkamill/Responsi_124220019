import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi_019/models/category_models.dart';
import 'package:responsi_019/models/meal_models.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));
    if (response.statusCode == 200) {
      final List categories = json.decode(response.body)['categories'];
      return categories.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Meal>> fetchMeals(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final List meals = json.decode(response.body)['meals'];
      return meals.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Map<String, dynamic>> fetchMealDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final mealDetail = json.decode(response.body)['meals'][0];
      return mealDetail;
    } else {
      throw Exception('Failed to load meal detail');
    }
  }
}
