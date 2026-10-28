import 'package:course/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  late Database database;

  opendatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

// Delete the database
    await deleteDatabase(path);

// open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, title TEXT, noteText TEXT)');
    });
  }

  insert(Note note) async {
    await database.insert('Note', note.toJson());
  }
}
