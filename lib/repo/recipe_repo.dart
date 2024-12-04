import 'package:http/http.dart' as http;


class RecipeRepo {
 Future <http.Response> getRecipes() async{
    final url = Uri.parse('https://api.jsonbin.io/v3/b/674f1565e41b4d34e45f1751');
    final response = await http.get(url);
    return response;
  }
}