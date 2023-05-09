abstract class Env {
  Future<void> load();
  operator [](String key);
}
