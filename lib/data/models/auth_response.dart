class AuthResponse {
  final String accessToken;
  final String tokenType;

  AuthResponse({
    required this.accessToken,
    required this.tokenType,
  });

  AuthResponse copyWith({
    String? accessToken,
    String? tokenType,
  }) =>
      AuthResponse(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
      );

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    accessToken: json["accessToken"],
    tokenType: json["tokenType"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "tokenType": tokenType,
  };
}
