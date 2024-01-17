class ApiExceptionEntity implements Exception {
  String message;
  int? errCode;
  StackTrace? stackTrace;

  ApiExceptionEntity({required this.message, this.errCode, this.stackTrace});

  @override
  String toString() =>
      'ApiExceptionEntity(message: $message, errCode: $errCode, stackTrace: $stackTrace)';
}
