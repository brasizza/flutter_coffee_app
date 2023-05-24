class UserPasswordException implements Exception {
  String cause;
  StackTrace? stack;
  UserPasswordException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
