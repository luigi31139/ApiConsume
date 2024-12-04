import 'dart:convert';
import 'package:apiconsume/models/recipes.dart';
import 'package:apiconsume/repo/recipe_repo.dart';

class RecipeController {

  final recipeRepo = RecipeRepo();

  Future<List<Recipe>>getRecipes() async {
    final response = await recipeRepo.getRecipes();
    final data = jsonDecode(response.body);
    List<Recipe> recipes = [];
    final recipesJson = data['record']['recipes'];

    for(dynamic recipeJson in recipesJson){
      recipes.add(Recipe.fromJson(recipeJson));
    }

    return recipes;
  }
}