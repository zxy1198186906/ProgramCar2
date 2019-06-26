import 'package:helloworld/ICondition.dart';
import 'package:helloworld/IResult.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:helloworld/ICase.dart';

mixin dbOperator{
  static const STATE_RUN = 1;
  static const STATE_STOP = 0;

  Future<void> create();
  Future<List<ICondition>> query(Case c);
  Future<void> insert(Case c);
  Future<void> updateState(Case c, bool state);
  Future<void> delete(Case c);
}

initDB() async{
  Directory documentsDir = await getApplicationDocumentsDirectory();
  String path = join(documentsDir.path, "programcar.db");
  return await openDatabase(path, version: 1, onOpen: (db){},
    onCreate: (Database db, int version) async{
      await db.execute("CREATE TABLE cases ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name TEXT,"
          "type INTEGER, "
          "destext TEXT, "
          "relation INTEGER, "
          "state INTEGER"
          ")"
      );
    });
}

class SQLite implements dbOperator{
  SQLite._();
  static final SQLite sqLite = SQLite._();
  static Database _database;

  @override
  Future<Database> create() async {
    // TODO: implement create
    if(_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  @override
  Future<void> delete(Case c) async{
    // TODO: implement delete
    final Database db = await _database;
    db.rawDelete("DROP TABLE IF EXISTS ${c.getCaseName()}");
  }

  @override
  Future<void> insert(Case c) async{
    // TODO: implement insert
    List<ICondition> Ocondition = c.getConditionList();
    List<IResult> Oresult = c.getResultList();

    final Database db = await _database;
    for(ICondition con in Ocondition)
      await db.insert("cases",
        con.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    for(IResult res in Oresult)
      await db.insert("cases",
        res.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<ICondition>> query(Case c) async{
    // TODO: implement query
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM cases WHERE name = ${c.getCaseName()}");
    return List.generate(maps.length, (i){
      return ICondition(c.getContext(), maps[i]["name"], maps[i]["type"],
        maps[i]["desText"], maps[i]["relation"], maps[i]["state"] == dbOperator.STATE_RUN? true : false);
    });
  }

  @override
  Future<void> updateState(Case c, bool state) async{
    // TODO: implement updateState
    final db = await _database;
    if(state)
      await db.rawUpdate("UPDATE cases SET state = 1 WHERE name = ${c.getCaseName()}");
    else
      await db.rawUpdate("UPDATE cases SET state = 0 WHERE name = ${c.getCaseName()}");
  }

}

