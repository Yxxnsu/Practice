class Common {
  final String totalCount;
  final String currentPage;
  final String countPerPage;
  final String errorCode;
  final String errorMsg;
  Common({
    required this.totalCount,
    required this.currentPage,
    required this.countPerPage,
    required this.errorCode,
    required this.errorMsg,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalCount': totalCount,
      'currentPage': currentPage,
      'countPerPage': countPerPage,
      'errorCode': errorCode,
      'errorMsg': errorMsg,
    };
  }

  factory Common.fromJson(Map<String, dynamic> json) {
    return Common(
      totalCount: json['totalCount'] ?? '',
      currentPage: json['currentPage'] ?? '',
      countPerPage: json['countPerPage'] ?? '',
      errorCode: json['errorCode'] ?? '',
      errorMsg: json['errorMsg'] ?? '',
    );
  }  
}
