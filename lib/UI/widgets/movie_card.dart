import 'package:cached_network_image/cached_network_image.dart';
import 'package:clonenetflix/UI/screens/movie_details.dart';
import 'package:clonenetflix/models/Movie.dart';
import 'package:flutter/material.dart';
class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context){
                  return MovieDetailsPage(movie: movie);
                })
            ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: movie.posterUrl(),
        fit: BoxFit.cover,
        errorWidget: (context,url,error) => Icon(Icons.error) ,
      ),
    );
  }
}
