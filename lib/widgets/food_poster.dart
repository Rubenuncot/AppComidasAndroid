import 'package:comidas/models/models.dart';
import 'package:comidas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePoster extends StatelessWidget {
  final List<Movie> movies;
  final int index;

  const MoviePoster({
    super.key,
    required this.movies,
    required this.index,  
  });

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final movie = movies[index];

    if(movies.isNotEmpty){
      final String movieName = movie.title;
      movie.heroId = "horizontalSlider-${movie.id}";
      return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: Column(
          children: [

            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '_details', arguments: movie ),

              child: Hero(
                tag: movie.heroId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                          
                  child: FadeInImage(
                    placeholder: const AssetImage('utils/images/notfound.gif'),
                    image: NetworkImage(movie.fullPosterUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              movieName, 
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),

          ],
        ),
      );
    } else {
      return Container(
              width: 130,
              height: 190,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              child: Column(
                children: [

                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '_details'),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                  
                      child: const FadeInImage(
                        placeholder: AssetImage('utils/images/notfound.gif'),
                        image: AssetImage('utils/images/notfound.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),
                ],
              ),
            );
    }
  }
}