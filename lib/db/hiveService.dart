import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String boxName;

  HiveService(this.boxName);

  Box<T> get box => Hive.box<T>(boxName);

  Future<void> addValue(dynamic key, T value) async {
    await box.put(key, value);
  }

  Future<bool> updateValue(dynamic key, T value) async {
    bool exists = box.containsKey(key);
    if (exists) await box.put(key, value);
    return exists;
  }

  Future<bool> deleteValue(dynamic key) async {
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

