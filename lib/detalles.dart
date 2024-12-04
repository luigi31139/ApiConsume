import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key, required this.recipe});

  final List recipe;

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  late YoutubePlayerController _controller;
  bool _showImage = true;

  @override
  void initState() {
    super.initState();
      final videoURL = widget.recipe[0].videourl;
      final videoId = YoutubePlayer.convertUrlToId(videoURL);
      _controller = YoutubePlayerController(initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: true)
      );
      Timer(Duration(seconds: 3), () {
      setState(() {
        _showImage = false;
      });
    });
  }


  @override
  void dispose() {
    super.dispose();
    _controller;
  }

  @override
  Widget build(BuildContext context) {
    final ingredients = widget.recipe[0].ingredients;
    final steps = widget.recipe[0].instructions;
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text(widget.recipe[0].name),backgroundColor: Colors.blue),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _showImage
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.network(widget.recipe[0].image),
                    )
                  : Container(
                      width: 600,
                      height: 250,
                      child: YoutubePlayer(controller: _controller)
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