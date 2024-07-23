import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchem/pages/watchlist_page.dart';
import 'package:watchem/services/movies_fetching.dart';
import 'package:watchem/utils/MyColors.dart';
import '../widgets/homePageWidgets/trending_movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MoviesContainerWidget(
                title: "Trending Movies",
                function: getTrending(),
                padEnds: false,
              ),
              MoviesContainerWidget(
                  title: "Top Rated", function: getTopRated()),
              MoviesContainerWidget(
                  title: "Now Playing", function: getNowPlaying()),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WatchlistPage()));
        },
        backgroundColor: MyColors.wheat,
        elevation: 10,
        child: Icon(
          CupertinoIcons.bookmark_solid,
          color: Colors.amber.shade900,
        ),
        ),
      ),
    );
  }
}
