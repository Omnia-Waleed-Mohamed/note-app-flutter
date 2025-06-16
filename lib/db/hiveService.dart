/*import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  String boxName;

  HiveService(this.boxName);
  //crud

  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox(Box<T> box) async {
    return await box.close();
  }

  Future<void> addValue(String key, T value) async {
    Box<T> box = await openBox();
    try {
      await box.put(key, value);
    } finally {
      await closeBox(box);
    }
  }

  Future<bool> updateValue(String key, T value) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);

      if (founded == true) await box.put(key, value);
    } finally {
      await closeBox(box);
    }

    return founded;
  }

  Future<bool> deleteValue(String key) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);

      if (founded == true) await box.delete(key);
    } finally {
      await closeBox(box);
    }

    return founded;
  }

  Future<T?> getValue(String key) async {
    Box<T> box = await openBox();
    T? data;

    try {
      data = await box.get(key);
    } finally {
      await closeBox(box);
    }

    return data;
  }
}*/import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String boxName;

  HiveService(this.boxName);

  Box<T> get box => Hive.box<T>(boxName);

  Future<void> addValue(String key, T value) async {
    await box.put(key, value);
  }

  Future<bool> updateValue(String key, T value) async {
    bool exists = box.containsKey(key);
    if (exists) await box.put(key, value);
    return exists;
  }

  Future<bool> deleteValue(String key) async {
    bool exists = box.containsKey(key);
    if (exists) await box.delete(key);
    return exists;
  }

  T? getValue(String key) {
    return box.get(key);
  }

  List<T> getAllValues() {
    return box.values.toList();
  }
}

