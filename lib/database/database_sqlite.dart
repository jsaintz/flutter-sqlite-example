import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQL_EXAMPLE');

    await openDatabase(
      databaseFinalPath,
      version: 1,
      onCreate: (Database db, int version) {
        final batch = db.batch();

        batch.execute('''
          create table teste(
            id Integer primary key autoincrement, nome varchar(200)
            )
        ''');

        batch.commit();
      },
      onUpgrade: (Database db, int oldVersion, int version) {},
      onDowngrade: (Database db, int oldVersion, int version) {},
    );
  }
}
