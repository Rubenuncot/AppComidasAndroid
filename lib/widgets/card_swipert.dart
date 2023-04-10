import 'package:card_swiper/card_swiper.dart';
import 'package:comidas/models/models.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: (size.height * 0.03)),
      width: double.infinity,
      height: size.height * 0.45,

      child: Swiper(
        autoplay: true,
        curve: Curves.bounceOut,
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, index) 

          { 
            final movie = movies[index];
            movie.heroId = "swiper-${movie.id}";
            return GestureDetector(            
            onTap: () { 
              Navigator.pushNamed(context, '_details', arguments: movie,);

            },

            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 100,       
                  clipBehavior: Clip.hardEdge,
                  shadowColor: Colors.green,
                  child: FadeInImage(
                    placeholder: const AssetImage('utils/images/notfound.gif'),
                    image: NetworkImage(movie.fullPosterUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );}
      ),
    );
  }
}