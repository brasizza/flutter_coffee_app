class SignUpException implements Exception {
  String cause;
  StackTrace? stack;
  SignUpException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
