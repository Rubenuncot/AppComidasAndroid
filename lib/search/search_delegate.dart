import 'package:comidas/models/models.dart';
import 'package:comidas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override 
  String? get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) =>
  [
    IconButton(
      onPressed: (){
        query = '';
      }, 
      icon: const Icon(Icons.clear_rounded),)
  ];

  @override
  Widget? buildLeading(BuildContext context) => 
  IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back_ios_new_rounded),);

  @override
  Widget buildResults(BuildContext context) => const Text("build results");

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<MoviesProvider>(context, listen: false);
    provider.getSuggestionByQuery(query);

    final size = MediaQuery.of(context).size;
      return Stack(
        children: [

          SizedBox(
            height: size.height,
            child: const FadeInImage(
              placeholder: AssetImage('utils/images/fondoLandscape.gif'),
              image: AssetImage('utils/images/fondoLandscape.gif'),
              fit: BoxFit.cover,
            ),
          ),
          if(query.isEmpty)
            Center(child: Icon(Icons.movie_outlined, size: 200, color: Colors.amberAccent[700],)),

          Container(
            color: Colors.black54,
          ),

          StreamBuilder(
            stream: provider.suggestionStream,
            builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
              final movies = snapshot.data;

              if(movies != null){
                print(movies);
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) => 
                  _Suggestions(movies: movies, index: index),
                );
              } else {
                  return Center(child: Icon(Icons.movie_outlined, size: 200, color: Colors.amberAccent[700],));
              }
            },
          ),
        ]
      );
  }
}

class _Suggestions extends StatelessWidget {
  const _Suggestions({
    super.key,
    required this.movies, 
    required this.index,
  });

  final List<Movie>? movies;
  final int index;

  @override
  Widget build(BuildContext context) {
    movies![index].heroId = "search-${movies![index].id}";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: 
      ListTile(
        onTap: () => Navigator.pushNamed(context, '_details', arguments: movies![index],),
        title: Text(movies![index].title, style: const TextStyle(color: Colors.white),),
        subtitle: Text(movies![index].originalTitle, style: const TextStyle(color: Colors.amber),),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.amber[300]),
        leading: Hero(
          tag: movies![index].heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              placeholder: const AssetImage('utils/images/movieLoading.gif'),
              image: NetworkImage(movies![index].fullPosterUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}