class ApiException implements Exception {
  final String message;
  final int? code;
  final int? s;

  ApiException({
    required this.message,
    this.code,
    this.s,
  });
}
