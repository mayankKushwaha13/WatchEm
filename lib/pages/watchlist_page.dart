import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchem/data/watchlist_database.dart';
import 'package:watchem/utils/MyColors.dart';
import 'package:watchem/utils/api.dart';
import 'package:watchem/widgets/my_appbar_widget.dart';

import '../models/movies_model.dart';
import '../services/movies_fetching.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppbarWidget(title: "Watchlist"),
              FutureBuilder(
                  future: WatchlistDatabase().readData(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/nothing.gif",
                            height: 400,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Nothing here...",
                            style: GoogleFonts.raleway(
                                color: Colors.white, fontSize: 18),
                          )
                        ],
                      );
                    } else {
                      List<Movie> watchlist = snapshot.data!;
                      return Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: watchlist.length,
                              itemBuilder: (context, index) {
                                Movie movie = watchlist[index];
                                List<String> movieGenres = [];
                                for (int i = 0; i < movie.genres.length; i++) {
                                  String toAdd = genres[genres.indexWhere((e) =>
                                      e['id'].toString() ==
                                      movie.genres[i])]['name'];
                                  movieGenres.add(toAdd);
                                }
                                return Card(
                                  color: MyColors.graniteGrey,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.network(
                                          "$imageUrl/${movie.posterPath}",
                                          height: 150,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.center,
                                              movie.title,
                                              style: GoogleFonts.slabo13px(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                for (int i = 0;i < movie.genres.length;i++)
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                    child: Container(
                                                      padding: const EdgeInsets.all(7),
                                                      decoration: BoxDecoration(
                                                          borderRadius:BorderRadius.circular(10),
                                                          border: Border.all(color: MyColors.wheat)),
                                                      child: Text(
                                                        movieGenres[i],
                                                        style: GoogleFonts.comicNeue(
                                                          color: MyColors.wheat,
                                                          fontSize: 12),
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          CupertinoIcons.delete_solid,
                                          color: MyColors.monarch,
                                        ),
                                        onPressed: () async {
                                          await WatchlistDatabase()
                                              .deleteData(movie.id);
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
