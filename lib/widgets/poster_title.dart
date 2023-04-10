import 'package:comidas/models/models.dart';
import 'package:flutter/material.dart';

class PosterTitle extends StatelessWidget {
  final Movie movie;
  const PosterTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 50,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
          
              child: 
              FadeInImage(
                height: 150,
                placeholder: const AssetImage('utils/images/notfound.gif'),
                  image: NetworkImage(movie.fullPosterUrl),
                  fit: BoxFit.cover,
              )
            ),
          ),

          const SizedBox(
            width: 20,
          ),

          Container(
            width: size.width * 0.5555,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children:[
                Text(movie.title, style: const TextStyle(color: Colors.white, fontSize: 30), overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(movie.originalTitle, style: const TextStyle(color: Color.fromARGB(255, 255, 198, 198)), overflow: TextOverflow.ellipsis, maxLines: 2,),
                Row(
                  children: [
                    const Icon(Icons.star, size: 15, color: Colors.white,),
                    const SizedBox(width: 15,),
                    Text(movie.voteAverage.toString(), style: const TextStyle(color: Color.fromARGB(255, 255, 198, 198)), overflow: TextOverflow.ellipsis, maxLines: 2,)
                  ],
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}