import 'package:apiconsume/controller/recipe_controller.dart';
import 'package:apiconsume/detalles.dart';
import 'package:apiconsume/login.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,leading: IconButton(onPressed: (){Navigator.pop(context,MaterialPageRoute(builder: (context) => LoginPage()));}, icon: const Icon(Icons.logout)),title:const Text('Choose Your Favorite'),backgroundColor: Colors.blue),
      body: FutureBuilder(
        future: RecipeController().getRecipes(), 
        builder: (context, snapshot) {
          
          snapshot.data;

          if(snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final recipes = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
            padding: const EdgeInsets.all(10),
             
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetails(recipe: [recipes[index]],)));
                },
                child: Center(
                  child: Container(
                    width: 230,
                    height: 300,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            recipes[index].image,
                            width: 130,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(recipes[index].name,style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                        Text('Prep Time: ${recipes[index].prepTimeMinutes} mins',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        Text('Cook Time: ${recipes[index].cookTimeMinutes} mins',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              );
            },
           );
        },
      )
    );
  }
}