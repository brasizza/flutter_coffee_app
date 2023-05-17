class WeakPasswordException implements Exception {
  String cause;
  StackTrace? stack;
  WeakPasswordException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
