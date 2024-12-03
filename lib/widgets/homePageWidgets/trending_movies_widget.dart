
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchem/pages/description_page.dart';

import '../../models/movies_model.dart';
import '../../utils/MyColors.dart';
import '../../utils/api.dart';

class MoviesContainerWidget extends StatelessWidget {
  const MoviesContainerWidget({
    super.key,
    required this.title,
    required this.function,
    this.padEnds = true,
  });
  final String title;
  final Future<List?> function;
  final bool padEnds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: GoogleFonts.josefinSans(
              color: MyColors.wheat,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 140,
        ),
        const SizedBox(height: 10,),
        FutureBuilder(
          future: function,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List results = snapshot.data!;
              List<Movie> movies = [];
              for (int i = 0; i < results.length; i++){
                movies.add(Movie.fromMap(results[i]));
              }
              return 
              CarouselSlider(
                items: movies.map((e){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DescriptionPage(
                    movie: e,
                  )));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "$imageUrl/${e.posterPath}",
                              height: 300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          e.title,
                          style : GoogleFonts.aBeeZee(
                            color: MyColors.wheat
                          )
                        )
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  padEnds: padEnds,
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  height: 300
                ),
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ],
    );
  }
}