class LoginResponse {
  String accessToken;
  String accessExpiry;
  String refreshToken;
  String refreshExpiry;
  int tokenResponse;

  LoginResponse(
      {this.accessToken,
        this.accessExpiry,
        this.refreshToken,
        this.refreshExpiry,
        this.tokenResponse});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['AccessToken'];
    accessExpiry = json['AccessExpiry'];
    refreshToken = json['RefreshToken'];
    refreshExpiry = json['RefreshExpiry'];
    tokenResponse = json['TokenResponse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccessToken'] = this.accessToken;
    data['AccessExpiry'] = this.accessExpiry;
    data['RefreshToken'] = this.refreshToken;
    data['RefreshExpiry'] = this.refreshExpiry;
    data['TokenResponse'] = this.tokenResponse;
    return data;
  }
}