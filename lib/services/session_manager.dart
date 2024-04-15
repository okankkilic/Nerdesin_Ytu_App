class SessionController {
  static final SessionController _session = SessionController._internal();

  String? userId;
  String? username;

  factory SessionController() {
    return _session;
  }
  SessionController._internal() {}
}
