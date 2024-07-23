class Movie {
  final String backdropPath;
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final double vote;
  final String releaseDate;
  final List genres;

  Movie(
      {
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.vote,
      required this.releaseDate,
      required this.genres
      });

  factory Movie.fromMap(Map<String, dynamic> map){
    return Movie(
      genres: map['genre_ids'],
      backdropPath: map['backdrop_path'],
      id: map['id'].toString(),
      overview: map['overview'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      vote: map['vote_average']
    );
  }

  factory Movie.fromTable(Map<String, dynamic> map){
    return Movie(
      genres: map['genres'].split(", "),
      backdropPath: map['backdropPath'],
      id: map['id'],
      overview: map['overview'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'],
      title: map['title'],
      vote: double.parse(map['vote'])
    );
  }

  toTable(){
    return {
      "backdropPath": backdropPath,
      "id" : id,
      "title" : title,
      "overview" : overview,
      "posterPath" : posterPath,
      "vote" : vote.toString(),
      "releaseDate" : releaseDate,
      "genres" : genres.join(", ")
    };
  }
}
