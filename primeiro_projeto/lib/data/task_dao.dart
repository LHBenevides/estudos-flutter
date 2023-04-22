import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT,)';

  static const String _tablename = 'tasktable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(TaskCard tarefa) async {
    print('save');
    final Database database = await getDataBase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('Tarefa não existe');
      return await database.insert(_tablename, taskMap);
    } else {
      print('Tarefa ja existe');
      return await database.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(TaskCard tarefa) {
    print('toMap on');
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print(mapaDeTarefas);
    return mapaDeTarefas;
  }

  Future<List<TaskCard>> findAll() async {
    print('acessando FindAll');
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print(result);
    return toList(result);
  }

  List<TaskCard> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('toList on');
    final List<TaskCard> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final TaskCard tarefa = TaskCard(
        linha[_name],
        linha[_difficulty],
        foto: linha[_image],
      );
      tarefas.add(tarefa);
    }
    print(tarefas);
    return tarefas;
  }

  Future<List<TaskCard>> find(String nomeDaTarefa) async {
    print('Find');
    final Database database = await getDataBase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print(result);
    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
