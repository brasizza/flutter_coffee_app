abstract class LocalStorage {
  Future<LocalStorage> init();
  Future<T> getData<T>(String key);
  Future<void> setData<T>(String key, T value);
  Future<bool> hasData(String key);
  Future<void> removeData(String key);
  Future<void> clearStorage();
  void listenKey(String key, {required Function action});
}
