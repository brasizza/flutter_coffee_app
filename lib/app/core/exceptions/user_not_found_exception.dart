class UserNotFoundException implements Exception {
  String cause;
  StackTrace? stack;
  UserNotFoundException(this.cause, {this.stack});
  @override
  String toString() => cause;
}
