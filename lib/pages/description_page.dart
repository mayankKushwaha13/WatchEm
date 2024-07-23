import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchem/data/watchlist_database.dart';
import 'package:watchem/models/movies_model.dart';
import 'package:watchem/services/movies_fetching.dart';
import 'package:watchem/utils/MyColors.dart';
import 'package:watchem/utils/api.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    List<String> movieGenres = [];
    for (int i = 0; i < movie.genres.length; i++) {
      String toAdd =
          genres[genres.indexWhere((e) => e['id'] == movie.genres[i])]['name'];
      movieGenres.add(toAdd);
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ShaderMask(
                blendMode: BlendMode.srcOver,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                      colors: [Colors.transparent, MyColors.asphalt],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 1]).createShader(bounds);
                },
                child: Image.network(
                  "$imageUrl${movie.backdropPath}",
                )),
            Wrap(
              runAlignment: WrapAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                for (int i = 0; i < movie.genres.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.wheat)),
                      child: Text(
                        movieGenres[i],
                        style: GoogleFonts.slabo13px(
                            color: MyColors.wheat, fontSize: 12),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/paper.png"),
                      fit: BoxFit.fill)),
              child: Text(
                movie.title,
                style: GoogleFonts.josefinSans(
                    fontSize: 22,
                    color: MyColors.burntUmber,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.star,
                      color: MyColors.monarch,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          movie.vote.toStringAsFixed(1),
                          style: GoogleFonts.lato(
                              color: MyColors.wheat,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " / 10",
                          style: GoogleFonts.lato(
                            color: MyColors.wheat,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: MyColors.geraldine,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Released on : ",
                          style: GoogleFonts.lato(
                              color: MyColors.wheat,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          movie.releaseDate.split("-").reversed.join("-"),
                          style: GoogleFonts.lato(
                            color: MyColors.wheat,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Divider(indent: 20,endIndent: 20,),
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Overview",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: MyColors.wheat,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Divider(indent: 20,endIndent: 250,),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                movie.overview,
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  color: MyColors.wheat,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            onPressed: () async {
              await WatchlistDatabase().insertData(movie);
            },
            backgroundColor: MyColors.geraldine,
            label: Text(
              "Add To Watchlist",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColors.asphalt
              ),
            ),
            elevation: 5,
            icon: const Icon(
              CupertinoIcons.bookmark_fill,
              color: MyColors.monarch,
            ),
          ),
        ),
      ),
    );
  }
}
