import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key, required this.recipe});

  final List recipe;
  
  @override
  Widget build(BuildContext context) {
    final ingredients = recipe[0].ingredients;
    final steps = recipe[0].instructions;
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text(recipe[0].name),backgroundColor: Colors.blue),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(recipe[0].image)
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text('Ingredients', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                const Text('•', style: TextStyle(fontSize: 20)),
                                const SizedBox(width: 8),
                                Expanded(child: Text(ingredients[index], style: const TextStyle(fontSize: 25)))],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Instructions', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: steps.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${index + 1}.', style: const TextStyle(fontSize: 25)),
                              const SizedBox(width: 8),
                              Expanded(child: Text(steps[index],style: const TextStyle(fontSize: 25),textAlign: TextAlign.left,),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}