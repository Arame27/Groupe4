import 'package:clonenetflix/UI/screens/casting.dart';
import 'package:clonenetflix/UI/widgets/action_button.dart';
import 'package:clonenetflix/UI/widgets/image_card.dart';
import 'package:clonenetflix/UI/widgets/movie_info.dart';
import 'package:clonenetflix/models/Movie.dart';
import 'package:clonenetflix/repositories/data_repository.dart';
import 'package:clonenetflix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    //Recupere les detail d'un movie
    Movie _movie = await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      newMovie = _movie;
      print(newMovie!.images![1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bbwBackgroundColor,
      appBar: AppBar(
        backgroundColor: bbwBackgroundColor,
        //leading: Image.asset('assets/images/netflix_logo_2.png'),
      ),
      body: newMovie == null
          ? Center(
              child: SpinKitFadingCircle(
                color: bbwPrimaryColor,
                size: 20,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  MovieInfo(newMovie: newMovie!),
                  const SizedBox(
                    height: 10,
                  ),
                  ActionButton(
                    label: "Lecture",
                    icon: Icons.play_arrow,
                    bgColor: Colors.white,
                    color: bbwBackgroundColor),
                  const SizedBox(
                    height: 5,
                  ),
                  ActionButton(
                    label: "Telecharcher la video",
                    icon: Icons.download,
                    bgColor: Colors.grey.withOpacity(0.3),
                    color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),

                  //Casting
                  Text(
                    "Casting",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: newMovie!.casting!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return newMovie!.casting![index].toMap().isEmpty
                            ? const Center()
                            : CastingCard(person: newMovie!.casting![index]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: newMovie!.images!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return newMovie!.images![index].isEmpty
                            ? const Center()
                            : ImageCard(image: newMovie!.images![index]);
                      },
                    ),
                  ),

                ],
              ),
      ),
    );
  }
}
