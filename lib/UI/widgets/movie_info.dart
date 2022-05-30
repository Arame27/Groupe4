import 'package:clonenetflix/UI/widgets/my_video_palyer.dart';
import 'package:clonenetflix/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfo extends StatelessWidget {
  final Movie newMovie;
  const MovieInfo({Key? key, required this.newMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
            child:newMovie.videos!.isEmpty
                ? Center(
                    child: Text(
                      "Pas de Video",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                )
                : MyVideoPlayer(movieId: newMovie.videos!.first)
        ),
            const SizedBox(
              width: 15,
            ),

      ],
    );
  }
}
