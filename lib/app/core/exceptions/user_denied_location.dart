class UserDeniedLocation implements Exception {
  String cause;
  StackTrace? stack;
  UserDeniedLocation(this.cause, {this.stack});
  @override
  String toString() => cause;
}
