import 'package:http/http.dart' as http;


class RecipeRepo {
 Future <http.Response> getRecipes() async{
    final url = Uri.parse('https://dummyjson.com/recipes');
    final response = await http.get(url);
    return response;
  }
}