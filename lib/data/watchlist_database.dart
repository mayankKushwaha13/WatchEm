import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watchem/models/movies_model.dart';

class WatchlistDatabase{
  static Database? _watchlistDB;

  Future<Database?> get watchlistDatabase async {
    if (_watchlistDB != null){
      return _watchlistDB;
    }

    String path = join(await getDatabasesPath(), 'watchlistDatabase.db');
    _watchlistDB = await openDatabase(
      path, version: 2,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE watchlist(
          backdropPath TEXT,
          id TEXT,
          title TEXT,
          overview TEXT,
          posterPath TEXT,
          vote TEXT,
          releaseDate TEXT,
          genres TEXT
          )
          '''
        );
      }
    );
    return _watchlistDB;
  }

  insertData(Movie movie) async {
    Database? db = await watchlistDatabase;
    db!.insert('watchlist', movie.toTable());
    print("added");
  }

  Future<List<Movie>> readData() async {
    Database? db = await watchlistDatabase;
    final list = await db!.query('watchlist');
    return list.map((map)=>Movie.fromTable(map)).toList();
  }

  deleteData(String id) async {
    Database? db = await watchlistDatabase;
    await db!.delete('watchlist',where: "id = ?", whereArgs: [id]);
  }
}