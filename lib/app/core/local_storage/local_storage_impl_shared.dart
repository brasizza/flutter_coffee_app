import 'package:shared_preferences/shared_preferences.dart';

import './local_storage.dart';

class LocalStorageImplShared implements LocalStorage {
  late SharedPreferences instance;
  @override
  Future<bool> clearStorage() async {
    return await instance.clear();
  }

  @override
  Future<T> getData<T>(String key) async {
    return instance.get(key) as T;
  }

  @override
  Future<bool> hasData(String key) async {
    return instance.containsKey(key);
  }

  @override
  Future<LocalStorage> init() async {
    instance = await SharedPreferences.getInstance();
    return this;
  }

  @override
  Future<bool> removeData(String key) async {
    return await instance.remove(key);
  }

  @override
  Future<bool> setData<T>(String key, T value) async {
    switch (T) {
      case bool:
        return await instance.setBool(key, value as bool);
      case double:
        return await instance.setDouble(key, value as double);
      case int:
        return await instance.setInt(key, value as int);

      case const (List<String>):
        return await instance.setStringList(key, value as List<String>);

      case String:
      default:
        return await instance.setString(key, value as String);
    }
  }

  @override
  void listenKey(String key, {required Function action}) {
    throw UnimplementedError();
  }
}
