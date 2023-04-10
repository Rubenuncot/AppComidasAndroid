import 'package:comidas/models/models.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Movie movie;

  const CustomAppBar({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, 
        titlePadding: const EdgeInsets.all(0),
        title: 
        
        Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(movie.title, style: const TextStyle(fontSize: 16),)
        ),

        background: 

        FadeInImage(
          placeholder: const AssetImage('utils/images/videoLoader.gif'),
          image: NetworkImage(movie.fullBackdropUrl),
          fit: BoxFit.cover,
        )),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }
}