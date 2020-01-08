import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//用 SQLite 做数据持久化
void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),

    onCreate: (db, version) {
      // When the database is first created, create a table to store dogs.
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY,'
        'name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );

  final apptitle = 'Sqlite Demo';

  runApp(MaterialApp(
    title: apptitle,
    home: Scaffold(
      appBar: AppBar(
        title: Text(apptitle),
      ),
    ),
  ));

  //插入数据
  Future<void> insertDog(Dog dog) async {
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //获取全部数据
  Future<List<Dog>> dogs() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (i) {
      final item = maps[i];
      return Dog(
        id: item['id'],
        name: item['name'],
        age: item['age'],
      );
    });
  }

  //更新数据
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  //删除数据
  Future<void> deleteDog(int id) async {
    final db = await database;

    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 5,
  );

  //插入一条狗狗数据
  await insertDog(fido);

  //打印列表
  print(await dogs());

  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );

  //更新狗狗数据
  await updateDog(fido);

  //打印列表
  print(await dogs());

  //删除狗狗数据
  await deleteDog(fido.id);

  //打印列表
  print(await dogs());

}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
