import 'package:comidas/models/models.dart';
import 'package:flutter/material.dart';

class DescriptionActors extends StatelessWidget {
  final Movie movie;
  const DescriptionActors({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '${movie.releaseDate} ${movie.overview}',
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}