class ErrorModel {
  final int statusCode;
  final int error;
  final String meassge;
  ErrorModel({
    required this.statusCode,
    required this.error,
    required this.meassge,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': false,
      'error': error,
      'meassge': meassge,
    };
  }
}
