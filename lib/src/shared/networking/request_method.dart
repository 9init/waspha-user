// ignore_for_file: constant_identifier_names
enum RequestMethod {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
  HEAD,
  OPTIONS,
  TRACE,
  CONNECT;

  @override
  String toString() => name.toLowerCase();
}
