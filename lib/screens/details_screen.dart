import 'package:comidas/models/models.dart';
import 'package:comidas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    //Todo: Cambiar por una instancia de food
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: size.height,
              width: size.width,
              child: const FadeInImage(
                
                placeholder: AssetImage('utils/images/fondoLandscape.gif'),
                image: AssetImage('utils/images/fondoLandscape.gif'),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeatX,
              ),
            ),

          Container(
            color: Colors.black45,
            child: CustomScrollView(
                
            slivers: [
              CustomAppBar(movie: movie,),
                
              SliverList(delegate: SliverChildListDelegate([
                PosterTitle(movie: movie,),
                
                DescriptionActors(movie: movie),

                HorizontalSliderCast(movieId: movie.id)
                
                //const HorizontalSlider(title: "Ingredientes",)
              ])),
            ],
                  ),
          ),]
      ),
    );
  }
}
