import 'package:path/path.dart';
import 'package:sindromemetabolica_fase2/model/registro.dart';
import 'package:sqflite/sqflite.dart';

class BaseDados {
  static final BaseDados instance = BaseDados._();
  static Database? _database;

  BaseDados._();

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await inicializaDB();
    return _database!;
  }

  inicializaDB() async {
    String path = join(await getDatabasesPath(), 'registros.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE registros(id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT, hora TEXT, altura INTEGER, ca INTEGER, faseclimaterio TEXT, praticaaf TEXT, alcool INTEGER, fumante INTEGER, bri REAL, iav REAL, risco REAL)",
    );
  }

  // Define a function that inserts dogs into the database
  Future<int> insertRegistro(Registro reg) async {
    // In this case, replace any previous data.
    final db = await BaseDados.instance.database;
    return await db.insert(
      'registros',
      reg.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  
  }

  Future<List<Registro>> registrosInseridos() async {
    // Query the table for all The Dogs.
    final db = await BaseDados.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('registros');
    //print(maps);

    List<Registro> regs = [];

    try {
      for (var m in maps) {
        regs.add(Registro(
            data: m['data'],
            hora: m['hora'],
            altura: m['altura'],
            ca: m['ca'],
            faseClimaterio: m['faseclimaterio'],
            praticaAF: m['praticaaf'],
            alcool: m['alcool'] == 1 ? true : false,
            fumante: m['fumante'] == 1 ? true : false,
            bri: m['bri'],
            iav: m['iav'],
            risco: m['risco']));
      }
    } catch (e) {
      print(e);
    }

    //print(regs);
    return regs;

  }
  Future close() async {
    final db = await database;
    db.close();
  }
}