import 'package:comidas/providers/movies_provider.dart';
import 'package:comidas/search/search_delegate.dart';
import 'package:comidas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas",),
        elevation: 0,
        actions:[
          IconButton(
            onPressed: () => showSearch(
              context: context, 
              delegate: MovieSearchDelegate(),
            ), 
            icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
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

            Column(
            children: [
            
              //CardSwiper
              CardSwiper( movies: moviesProvider.onDisplayMovies,),
              HorizontalSlider(
                onNextPage: () {moviesProvider.getPopularMovies();},
                title: "Populares", 
                movies: moviesProvider.onDisplayPopularMovies, 
              ),
        
            ],
          ),]
        ),
      )
            //Todo: Listado Horizontal Peliculas
    );
  }
}
