import 'package:clonenetflix/UI/widgets/movie_card.dart';
import 'package:clonenetflix/models/Movie.dart';
import 'package:clonenetflix/repositories/data_repository.dart';
import 'package:clonenetflix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Movie>? movies;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);
    return Scaffold(
      backgroundColor: bbwBackgroundColor,
      appBar: AppBar(
        backgroundColor: bbwBackgroundColor,
        leading: Image.asset("assets/images/Logo.png"),
      ),
      body: ListView(
        children: [
          Container(
            height: 660,
            color: Colors.red,
            child: dataProvider.popularMovieList.isEmpty
                ? const Center(
                    child: Text("Film Indisponible"),
                  )
                : MovieCard(movie: dataProvider.popularMovieList[0])
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Tendances actuelles",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 190.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.popularMovieList.length,
              itemBuilder: ((context, index) => Container(
                    width: 172,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.amber,
                      child: dataProvider.popularMovieList.isEmpty
                          ? const Center(
                        child: Text("Film Indisponible"),
                      )
                          : MovieCard(movie: dataProvider.popularMovieList[index+1])

                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Actuellement au Cinéma",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 375,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.popularMovieList.length,
              itemBuilder: ((context, index) => Container(
                width: 250,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.red,
                child: dataProvider.popularMovieList.isEmpty
                    ? Center(
                  child: Text("Film Indisponible"),
                )
                    : MovieCard(movie: dataProvider.popularMovieList[index+3])

              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Ils arrivent Bientot",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 190.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.popularMovieList.length,
              itemBuilder: ((context, index) => Container(
                width: 119,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.green,
                child: dataProvider.popularMovieList.isEmpty
                    ? Center(
                  child: Text("Film Indisponible"),
                )
                    : MovieCard(movie: dataProvider.popularMovieList[index+10])

              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Animation",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 190.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.popularMovieList.length,
              itemBuilder: ((context, index) => Container(
                width: 119,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.blue,
                child: dataProvider.popularMovieList.isEmpty
                    ? Center(
                  child: Text("Film Indisponible"),
                )
                    : MovieCard(movie: dataProvider.popularMovieList[index+10])

              )),
            ),
          ),
        ],
      ),
    );
  }
}
