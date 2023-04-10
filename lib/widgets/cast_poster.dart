import 'package:comidas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastPoster extends StatelessWidget {
  final int movieId;
  final int index;
  const CastPoster({
    super.key,
    required this.index, 
    required this.movieId, 
  });

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);


    return FutureBuilder(
      future: moviesProvider.getCast(movieId),
      builder: (_, AsyncSnapshot snapshot){
        if(snapshot.data != null){
          final actor = snapshot.data![index];
          if(actor.id != 0){
            final String actorName = actor.name;

            return Container(
              width: 130,
              height: 190,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              child: Column(
                children: [

                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                  
                      child: FadeInImage(
                        placeholder: const AssetImage('utils/images/notfound.gif'),
                        image: NetworkImage(actor.fullImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    actorName, 
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),

                ],
              ),
            );
          }
          else {
            return const NullReturn();
          }
        } else {
          return const NullReturn();
        }
        }
    );
  }
}

class NullReturn extends StatelessWidget {
  const NullReturn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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