class InvalidEmailException implements Exception {
  String cause;
  StackTrace? stack;
  InvalidEmailException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
