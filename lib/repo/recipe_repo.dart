import 'package:http/http.dart' as http;
import 'dart:developer';


class RecipeRepo {
 Future <http.Response> getRecipes() async{
    final url = Uri.parse('https://dummyjson.com/recipes');
    final response = await http.get(url);
    log(response.body);
    return response;
  }
}