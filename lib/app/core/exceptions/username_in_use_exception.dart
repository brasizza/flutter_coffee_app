class EmailInUseException implements Exception {
  String cause;
  StackTrace? stack;
  EmailInUseException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
