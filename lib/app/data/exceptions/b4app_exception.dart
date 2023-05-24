class Back4AppException implements Exception {
  String cause;
  StackTrace? stack;
  Back4AppException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
